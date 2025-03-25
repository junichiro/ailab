# Use the native inference API to send a text message to Anthropic Claude.

import boto3
import json
import os
from dotenv import load_dotenv

from botocore.exceptions import ClientError

# Load environment variables from .env file
load_dotenv()

# Create a Bedrock Runtime client in the AWS Region of your choice.
region_name = os.getenv('AWS_DEFAULT_REGION', 'ap-northeast-1')
client = boto3.client("bedrock-runtime", region_name=region_name)

# Set the model ID, e.g., Claude 3 Haiku.
model_id = "anthropic.claude-3-5-sonnet-20240620-v1:0"

# Define the prompt for the model.
prompt = "Describe the purpose of a 'hello world' program in one line."

# Format the request payload using the model's native structure.
native_request = {
    "anthropic_version": "bedrock-2023-05-31",
    "max_tokens": 512,
    "temperature": 0.5,
    "messages": [
        {
            "role": "user",
            "content": [{"type": "text", "text": prompt}],
        }
    ],
}

# Convert the native request to JSON.
request = json.dumps(native_request)

try:
    # Invoke the model with the request.
    response = client.invoke_model(modelId=model_id, body=request)

except (ClientError, Exception) as e:
    print(f"ERROR: Can't invoke '{model_id}'. Reason: {e}")
    exit(1)

# Decode the response body.
model_response = json.loads(response["body"].read())

# Extract and print the response text.
response_text = model_response["content"][0]["text"]
print(response_text)
