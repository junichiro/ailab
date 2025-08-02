# Manual Test Plan for create-private-repo Command

## テストシナリオ

### 1. 正常系テスト
- コマンド: `/create-private-repo test-private-repo-2025`
- 期待結果:
  - リポジトリ名の検証が実行される
  - 既存リポジトリの確認が実行される
  - プライベートリポジトリが作成される
  - 初期ファイルがセットアップされる
  - 完了報告が表示される

### 2. エラー系テスト

#### 2.1 リポジトリ名なし
- コマンド: `/create-private-repo`
- 期待結果: エラーメッセージが表示される

#### 2.2 無効な文字を含むリポジトリ名
- コマンド: `/create-private-repo test@repo!`
- 期待結果: 命名規則エラーと修正案が表示される

#### 2.3 既存リポジトリ名
- コマンド: `/create-private-repo ailab`
- 期待結果: 既存リポジトリの情報が表示され、処理が中断される

## コマンドが実行する主な処理

1. `gh repo view $ARGUMENTS` - 既存確認
2. `gh repo create $ARGUMENTS --private --description "Created by Claude Code" --clone`
3. `cd $ARGUMENTS`
4. README.mdと.gitignoreの作成
5. `git add .`
6. `git commit -m "Initial commit with README and .gitignore"`
7. `git push origin main`