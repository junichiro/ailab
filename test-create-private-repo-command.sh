#!/bin/bash

# TDD用テストスクリプト: create-private-repo.mdコマンドの検証

echo "=== Claude Code slash command test for create-private-repo ==="

# テスト1: コマンドファイルが存在するか確認
test_file_exists() {
    echo -n "Test 1 - コマンドファイルの存在確認: "
    if [ -f "claude-settings/commands/create-private-repo.md" ]; then
        echo "✓ PASS"
        return 0
    else
        echo "✗ FAIL - ファイルが存在しません"
        return 1
    fi
}

# テスト2: 必須要素の確認
test_required_elements() {
    echo -n "Test 2 - 必須要素の確認: "
    if [ ! -f "claude-settings/commands/create-private-repo.md" ]; then
        echo "✗ FAIL - ファイルが存在しません"
        return 1
    fi
    
    local content=$(cat claude-settings/commands/create-private-repo.md)
    local errors=()
    
    # タイトルの確認
    if ! echo "$content" | grep -q "^# "; then
        errors+=("タイトルがありません")
    fi
    
    # $ARGUMENTSの使用確認
    if ! echo "$content" | grep -q '\$ARGUMENTS'; then
        errors+=("$ARGUMENTSが使用されていません")
    fi
    
    # gh repo createの使用確認
    if ! echo "$content" | grep -q 'gh repo create'; then
        errors+=("gh repo createコマンドが含まれていません")
    fi
    
    # --privateフラグの確認
    if ! echo "$content" | grep -q '\-\-private'; then
        errors+=("--privateフラグが含まれていません")
    fi
    
    if [ ${#errors[@]} -eq 0 ]; then
        echo "✓ PASS"
        return 0
    else
        echo "✗ FAIL"
        for error in "${errors[@]}"; do
            echo "  - $error"
        done
        return 1
    fi
}

# テスト3: 構造の確認
test_structure() {
    echo -n "Test 3 - ドキュメント構造の確認: "
    if [ ! -f "claude-settings/commands/create-private-repo.md" ]; then
        echo "✗ FAIL - ファイルが存在しません"
        return 1
    fi
    
    local content=$(cat claude-settings/commands/create-private-repo.md)
    local errors=()
    
    # 実行手順セクションの確認
    if ! echo "$content" | grep -q -E "(実行手順|Steps|手順|Instructions)"; then
        errors+=("実行手順セクションがありません")
    fi
    
    # エラーハンドリングの記述確認
    if ! echo "$content" | grep -q -E "(エラー|error|Error|失敗|既存)"; then
        errors+=("エラーハンドリングの記述がありません")
    fi
    
    if [ ${#errors[@]} -eq 0 ]; then
        echo "✓ PASS"
        return 0
    else
        echo "✗ FAIL"
        for error in "${errors[@]}"; do
            echo "  - $error"
        done
        return 1
    fi
}

# テストの実行
echo ""
test_file_exists
result1=$?

test_required_elements
result2=$?

test_structure
result3=$?

echo ""
echo "=== テスト結果サマリー ==="
if [ $result1 -eq 0 ] && [ $result2 -eq 0 ] && [ $result3 -eq 0 ]; then
    echo "全てのテストがPASSしました ✓"
    exit 0
else
    echo "一部のテストがFAILしました ✗"
    exit 1
fi