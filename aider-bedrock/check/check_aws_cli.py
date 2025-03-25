import boto3

def check_aws_config():
    try:
        # STSを使用して現在のユーザー情報を取得
        sts_client = boto3.client('sts')
        caller_identity = sts_client.get_caller_identity()
        
        print("AWS 設定は正しく構成されています。")
        print(f"アカウントID: {caller_identity['Account']}")
        print(f"ユーザーARN: {caller_identity['Arn']}")
        return True
    
    except Exception as e:
        print("AWS 設定に問題があります：")
        print(str(e))
        return False

if __name__ == "__main__":
    check_aws_config()

