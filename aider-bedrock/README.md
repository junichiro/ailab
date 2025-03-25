# Using Aider with AWS Bedrock Models

This guide explains how to set up and use Aider with AWS Bedrock models.

## Prerequisites

1. An AWS account with access to Bedrock models
2. AWS CLI installed and configured
3. Python 3.7 or later
4. Aider installed (`pip install aider-chat`)

## Setup

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/aider-bedrock.git
   cd aider-bedrock
   ```

2. Copy the `.env.example` file to `.env` and fill in your AWS credentials:
   ```
   cp .env.example .env
   ```
   Edit the `.env` file with your AWS region, access key ID, and secret access key for Bedrock.

3. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

## Using Aider with Bedrock

1. Start Aider with the Bedrock model:
   ```
   aider --model bedrock/anthropic.claude-3-sonnet-20240320-v1:0
   ```

2. Aider will now use the specified Bedrock model for code assistance and generation.

3. You can now use Aider as usual, asking questions, requesting code changes, or generating new code.

## Checking Your Setup

To verify that your AWS Bedrock setup is working correctly:

1. Run the AWS CLI check script:
   ```
   python check/check_aws_cli.py
   ```

2. Run the AWS Bedrock check script:
   ```
   python check/check_aws_bedrock.py
   ```

These scripts will help ensure that your AWS configuration and Bedrock access are properly set up.

## Environment Variables

The following environment variables should be set in your `.env` file:

- `AWS_REGION`: Your default AWS region (e.g., us-west-2)
- `AWS_ACCESS_KEY_ID`: Your AWS access key ID for Bedrock
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key for Bedrock

## Troubleshooting

If you encounter any issues:

1. Ensure your AWS credentials in the `.env` file are correct.
2. Check that you have the necessary permissions in your AWS account to access Bedrock models.
3. Verify that your AWS CLI is configured correctly.
4. Make sure you're using a compatible version of Aider.

For more information, refer to the [Aider documentation](https://aider.chat/docs/) and [AWS Bedrock documentation](https://docs.aws.amazon.com/bedrock/).
