# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

AILabは、様々なAIツールやスクリプトを実験・開発するための統合リポジトリです。Claude Code、Aider、AWS Bedrockなどの最新AIツールを活用し、開発効率の向上を目指しています。

## プロジェクト構造

### ディレクトリ構成と役割

- **aider-bedrock/**: AWS BedrockでAiderを使用するためのセットアップと検証ツール
  - `check/`: AWS CLIとBedrockの接続確認スクリプト
  - AWS Bedrockモデルとの統合設定ファイル

- **claude-settings/**: Claude Code用のカスタム設定とコマンド
  - **commands/**: カスタムスラッシュコマンド定義（重要）
    - `clear-merged-branches.md`: マージ済みブランチの削除コマンド
    - `issue.md`, `issue-full.md`: GitHub Issue作成用コマンド
    - `pr-review-response.md`: PRレビュー応答生成コマンド
  - `settings.json`: Claude Code設定ファイル
  - `CLAUDE.md`: claude-settings固有の指示

- **review-ai/**: AI駆動のコードレビューツール
  - `review-ai.sh`: o3-miniモデルを使用した自動レビュースクリプト
  - diffファイルを入力として日本語でのコードレビューを実行

- **instructions/**: AIアシスタント用のペルソナと指示定義
  - `poker-advisor.md`: ポーカーアドバイザーペルソナ
  - 他のAIアシスタント用指示を追加可能

- **install-claude-settings.sh**: Claude Code設定の自動インストールスクリプト

- **main.py**: プロジェクトのエントリーポイント

### ファイルタイプ別の配置ガイドライン

| ディレクトリ | 配置すべきファイル |
|------------|----------------|
| `/` (ルート) | README.md、CLAUDE.md、CONVENTIONS.md、pyproject.toml、設定スクリプト |
| `aider-bedrock/` | AWS Bedrock関連の設定、検証スクリプト、統合コード |
| `claude-settings/commands/` | Claude Code用カスタムコマンド（.mdファイル） |
| `review-ai/` | コードレビュー関連のスクリプト、設定、テンプレート |
| `instructions/` | AIアシスタント用のペルソナ定義、プロンプトテンプレート |

## Development Environment

This project uses **uv** for Python package management with Python 3.12+.

### Setup Commands
```bash
# Project setup (if starting fresh)
uv init [project-name]
uv python install 3.12
uv venv --python 3.12
source .venv/bin/activate

# Install dependencies
uv sync
```

### Running Code
```bash
# Run main script
python main.py

# AWS Bedrock health checks
python aider-bedrock/check/check_aws_cli.py
python aider-bedrock/check/check_aws_bedrock.py

# AI code review (requires diff file)
./review-ai/review-ai.sh [diff-file]
```

## AI Integration Patterns

### AWS Bedrock Setup
- Uses boto3 for AWS Bedrock API access
- Requires AWS credentials and region configuration
- Default model: `anthropic.claude-3-5-sonnet-20240620-v1:0`
- Health check scripts validate AWS CLI and Bedrock connectivity

### Aider Integration
- **review-ai.sh**: Automated code review using o3-mini with high reasoning effort
- Uses Japanese language for reviews with specific personas
- Configured with `--architect`, `--subtree-only`, and `--no-auto-commit` flags

## Code Conventions

- Use httpx over requests for HTTP requests
- Type hints everywhere possible
- f-strings for string formatting
- Include docstrings for all public functions, classes, and methods
- Separate AI configuration from business logic
- Include error handling for all AI API calls
- Keep model-specific code isolated in adapter layers
- Log AI interactions appropriately while respecting privacy
- Apply consistent validation for AI-generated outputs