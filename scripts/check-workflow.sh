#!/usr/bin/env bash
# 校验本仓库规范的结构不变量。非零退出即失败。
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0

# 1. 每个阶段规范必须非空
for f in skills/*/SKILL.md; do
  [ -s "$f" ] || { echo "EMPTY: $f"; fail=1; }
done

# 2. frontmatter 必填字段，且 name 必须等于目录名
for f in skills/*/SKILL.md; do
  for key in name description version tags; do
    grep -q "^$key:" "$f" || { echo "MISSING FIELD '$key': $f"; fail=1; }
  done
  dir=$(basename "$(dirname "$f")")
  have=$(grep -m1 '^name: ' "$f" | cut -d' ' -f2)
  [ "$have" = "$dir" ] || { echo "NAME MISMATCH: $f (name=$have, dir=$dir)"; fail=1; }
done

# 3. AGENTS.md 的索引链接必须可解析
while read -r p; do
  [ -f "$p" ] || { echo "BROKEN LINK: $p"; fail=1; }
done < <(grep -o '](skills/[^)]*)' AGENTS.md | sed 's/](//;s/)$//')

# 4. AGENTS.md 阶段编号必须连续，且与 skills/ 目录数量一致
expected=$(find skills -mindepth 1 -maxdepth 1 -type d | wc -l)
actual=$(grep -c '^| \*\*[0-9][0-9]\*\* ' AGENTS.md)
[ "$expected" = "$actual" ] || { echo "STAGE COUNT: skills=$expected, AGENTS=$actual"; fail=1; }
nums=$(grep -o '^| \*\*[0-9][0-9]\*\*' AGENTS.md | grep -o '[0-9][0-9]' | tr '\n' ' ')
want=$(seq -f "%02g" 0 $((expected - 1)) | tr '\n' ' ')
[ "$nums" = "$want" ] || { echo "STAGE NUMBERING: got [$nums] want [$want]"; fail=1; }

# 5. README.md 不得复述阶段表（单一真源在 AGENTS.md）
if grep -q '^| \*\*[0-9][0-9]\*\* ' README.md; then
  echo "DUPLICATE STAGE TABLE: README.md"
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  echo "spec-check: ok ($expected skills)"
fi
exit "$fail"
