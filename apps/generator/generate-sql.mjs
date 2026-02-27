import fs from "node:fs";
import path from "node:path";
import yaml from "js-yaml";

const ROOT = process.cwd();
const METRICS_DIR = path.join(ROOT, "packages", "kpi-registry", "metrics");
const OUT_DIR = path.join(ROOT, "sql", "marts");

fs.mkdirSync(OUT_DIR, { recursive: true });

function readYaml(filePath) {
  const raw = fs.readFileSync(filePath, "utf8");
  return yaml.load(raw);
}

function sqlHeader(meta) {
  const lines = [];
  lines.push("-- AUTO-GENERATED: do not edit directly");
  lines.push(`-- metric_id: ${meta.id ?? "unknown"}`);
  lines.push(`-- name: ${meta.name ?? ""}`);
  lines.push(`-- owner: ${meta.owner ?? ""}`);
  lines.push(`-- category: ${meta.category ?? ""}`);
  if (meta.grain?.time_basis) lines.push(`-- time_basis: ${meta.grain.time_basis}`);
  if (meta.grain?.level) lines.push(`-- grain_level: ${meta.grain.level}`);
  return lines.join("\n");
}

function stubSql(meta) {
  const expr = meta.definition?.expression ?? "/* TODO: define expression */";
  const system = meta.source?.system ?? "UNKNOWN_SYSTEM";
  const entity = meta.source?.entity ?? "UNKNOWN_ENTITY";
  const timeBasis = meta.grain?.time_basis ?? "/* TODO: time basis */";

  return `${sqlHeader(meta)}
-- source: ${system}.${entity}

-- TODO:
-- 1) Map source fields -> canonical fields
-- 2) Apply filters (include/exclude)
-- 3) Add territory/segment joins
-- 4) Implement attribution rule + exceptions if needed

select
  '${meta.id}' as metric_id,
  /* ${timeBasis} */ null::timestamp as metric_time,
  /* territory */ null::text as territory,
  /* segment */ null::text as segment,
  ${expr} as metric_value
from /* TODO: ${system}_${entity} */ (select 1) t
;
`;
}

const files = fs.readdirSync(METRICS_DIR).filter(f => f.endsWith(".yaml") || f.endsWith(".yml"));

let count = 0;
for (const f of files) {
  const full = path.join(METRICS_DIR, f);
  const meta = readYaml(full);

  if (!meta?.id) {
    console.error(`Skipping ${f}: missing id`);
    continue;
  }

  const outPath = path.join(OUT_DIR, `${meta.id}.sql`);
  fs.writeFileSync(outPath, stubSql(meta), "utf8");
  count++;
}

console.log(`Generated ${count} SQL stub(s) into ${path.relative(ROOT, OUT_DIR)}`);
