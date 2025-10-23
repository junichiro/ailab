"""
共通定数の定義

このモジュールには、プロジェクト全体で使用される定数を定義します。
"""

# AWS Bedrock モデル定数
DEFAULT_BEDROCK_MODEL: str = "anthropic.claude-3-5-sonnet-20241022-v2:0"
"""デフォルトのBedrock LLMモデルID (Claude 3.5 Sonnet v2)"""

# リージョン設定
DEFAULT_AWS_REGION: str = "ap-northeast-1"
"""デフォルトのAWSリージョン"""
