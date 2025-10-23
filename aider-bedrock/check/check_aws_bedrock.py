# Use the native inference API to send a text message to Anthropic Claude.

import boto3
import json
import os
import sys
from pathlib import Path

# Add the parent directory to the path to import constants
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from dotenv import load_dotenv
from botocore.exceptions import ClientError
from constants import DEFAULT_BEDROCK_MODEL, DEFAULT_AWS_REGION

# Load environment variables from .env file
load_dotenv()

# Create a Bedrock Runtime client in the AWS Region of your choice.
region_name = os.getenv('AWS_DEFAULT_REGION')
if not region_name:
    print(f"Warning: AWS_DEFAULT_REGION not set. Using default: {DEFAULT_AWS_REGION}")
    region_name = DEFAULT_AWS_REGION
client = boto3.client("bedrock-runtime", region_name=region_name)

# Set the model ID from constants.
model_id = DEFAULT_BEDROCK_MODEL

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
