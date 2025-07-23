# Create Private GitHub Repository

新しいプライベートGitHubリポジトリを作成し、ローカル環境にセットアップします: $ARGUMENTS

## 実行手順

1. **リポジトリ名の検証**
   - `$ARGUMENTS`が空でないことを確認
   - GitHubの命名規則（英数字、ハイフン、アンダースコアのみ）に準拠しているか検証
   - 名前が適切でない場合は、修正案を提示

2. **既存リポジトリの確認**
   - `gh repo view $ARGUMENTS` を実行して同名のリポジトリが存在しないか確認
   - 既に存在する場合:
     - 既存リポジトリのURLとvisibilityを表示
     - 処理を中断し、別の名前を提案

3. **プライベートリポジトリの作成**
   - 以下のコマンドを実行:
     ```bash
     gh repo create $ARGUMENTS --private --description "Created by Claude Code" --clone
     ```
   - 成功メッセージとリポジトリURLを確認

4. **初期ファイルのセットアップ**
   - 作成されたディレクトリに移動: `cd $ARGUMENTS`
   - 基本的なREADME.mdを作成:
     ```markdown
     # $ARGUMENTS
     
     Created by Claude Code
     
     ## Description
     
     [プロジェクトの説明をここに記入]
     
     ## Getting Started
     
     [使用方法をここに記入]
     ```
   - 汎用的な.gitignoreを作成（Node.js, Python, macOS, Windows用のパターンを含む）
   - 初期コミットの作成:
     ```bash
     git add .
     git commit -m "Initial commit with README and .gitignore"
     git push origin main
     ```

5. **完了報告**
   - 作成されたリポジトリのGitHub URL
   - ローカルリポジトリのパス
   - 次のステップの提案（CLAUDE.mdの追加、CI/CDの設定など）

## エラーハンドリング

- リポジトリ名が指定されていない場合: 明確なエラーメッセージを表示
- 既存のリポジトリと重複する場合: 既存リポジトリのURLを表示して中断
- GitHubの認証エラー: gh authの設定方法を案内
- ネットワークエラー: 接続確認の方法を提示

## 注意事項

- プライベートリポジトリはデフォルトで作成されます
- リポジトリの説明は後から`gh repo edit`で変更可能です
- 作成後は現在のディレクトリから新しいリポジトリディレクトリに移動します