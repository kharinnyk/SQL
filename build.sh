#!/bin/bash
# Gera index.html (página única e autocontida) a partir de src/ e lib/.
# Requisitos: bash e Node.js (só para validar o JavaScript).
set -e
cd "$(dirname "$0")"
JS="src/util.js src/content1.js src/content2.js src/content4.js src/content3.js src/art.js src/sims.js src/lab.js src/app.js"
mkdir -p dist
cat $JS > dist/all.js
node --check dist/all.js
{
  echo '<!doctype html>'
  echo '<html lang="pt-BR">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  echo '<title>SQL na Biblioteca</title>'
  echo '<link rel="preconnect" href="https://fonts.googleapis.com">'
  echo '<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600&family=JetBrains+Mono:wght@400;500;700&family=Nunito:ital,wght@0,400;0,600;0,700;0,800;1,400&display=swap">'
  echo '<style>:root{color-scheme:light;padding:env(safe-area-inset-top,0px) 0 env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui}img{max-width:100%}[hidden]{display:none!important}</style>'
  echo '<style>'; cat src/style.css; echo '</style>'
  echo '</head>'
  echo '<body>'
  cat src/body.html
  echo '<script>'; cat lib/sql-asm.js; echo '</script>'
  echo '<script>'; cat dist/all.js; echo '</script>'
  echo '</body>'
  echo '</html>'
} > index.html
rm -rf dist
ls -la index.html
