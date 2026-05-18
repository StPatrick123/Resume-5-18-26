#!/usr/bin/env bash
# scripts/build-exports.sh
# Runs after `astro build` has populated dist/. Generates:
#   dist/resume.pdf  via WeasyPrint (rendered HTML → PDF)
#   dist/resume.docx via Pandoc (markdown → DOCX, with reference styling)
#   dist/resume.rtf  via Pandoc (markdown → RTF)
#
# All three include a "View online" back-link to SITE_URL. The HTML build
# already lives at dist/index.html.

set -euo pipefail

SITE_URL="${SITE_URL:-https://ada.example.com}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="$ROOT/dist"
SRC_MD="$ROOT/src/content/resume.md"
FOOTER="$ROOT/templates/footer.md"
REF_DOCX="$ROOT/templates/reference.docx"

mkdir -p "$DIST"

# --- 1. Build the footer with the live URL baked in. -----------------------
# templates/ may not exist on a fresh checkout (footer.md is gitignored and
# reference.docx is optional), so make sure the directory is there first.

mkdir -p "$(dirname "$FOOTER")"
cat > "$FOOTER" <<EOF
---

*View the live, always-current version of this resume at <$SITE_URL>.*
EOF

# --- 2. Combine resume markdown + footer for non-HTML exports. -------------

COMBINED="$(mktemp --suffix=.md)"
trap 'rm -f "$COMBINED"' EXIT
cat "$SRC_MD" "$FOOTER" > "$COMBINED"

# --- 3. DOCX via Pandoc. ---------------------------------------------------

echo "→ Building resume.docx"
if [[ -f "$REF_DOCX" ]]; then
  pandoc "$COMBINED" \
    --from=markdown \
    --to=docx \
    --reference-doc="$REF_DOCX" \
    --metadata "title=Resume" \
    -o "$DIST/resume.docx"
else
  echo "  (no reference.docx — using Pandoc defaults; see README to customize)"
  pandoc "$COMBINED" \
    --from=markdown \
    --to=docx \
    --metadata "title=Resume" \
    -o "$DIST/resume.docx"
fi

# --- 4. RTF via Pandoc. ----------------------------------------------------

echo "→ Building resume.rtf"
pandoc "$COMBINED" \
  --from=markdown \
  --to=rtf \
  --standalone \
  --metadata "title=Resume" \
  -o "$DIST/resume.rtf"

# --- 5. PDF via WeasyPrint, from the rendered HTML. ------------------------
# Using the actual built HTML means the PDF matches the website exactly.
# WeasyPrint reads our @page rules in print.css for headers/footers/margins.

echo "→ Building resume.pdf"
if command -v weasyprint >/dev/null 2>&1; then
  weasyprint "$DIST/index.html" "$DIST/resume.pdf" \
    --base-url "$DIST/" \
    --presentational-hints
else
  echo "  WARNING: weasyprint not installed; falling back to Pandoc PDF."
  echo "  Install with: pip install weasyprint  (or: nix develop)"
  pandoc "$COMBINED" \
    --from=markdown \
    --pdf-engine=weasyprint \
    -o "$DIST/resume.pdf" \
    || echo "  PDF generation failed — install weasyprint or a LaTeX engine."
fi

echo ""
echo "✓ Exports built:"
ls -lh "$DIST"/resume.* 2>/dev/null || true
