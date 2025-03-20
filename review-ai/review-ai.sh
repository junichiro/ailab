file="$1"

aider $file \
  --no-gitignore \
  --subtree-only \
  --model o3-mini \
  --architect \
  --reasoning-effort high \
  --editor-model gpt-4o-mini \
  --no-detect-urls \
  --no-auto-commit \
  --yes-always \
  --message "${file} はある Pull Request の差分をファイルに保存したものです。あなたはシニアエンジニアとしてこの差分ファイルを見てレビューをしてください。レビューは日本語で、また指摘箇所が明確にわかるようにファイル名と行数を明示してください。"

