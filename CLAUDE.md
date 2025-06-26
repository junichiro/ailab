# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Structure

This is an experimental AI laboratory with multiple AI-powered tools and scripts:

- **aider-bedrock/**: Setup for using Aider with AWS Bedrock models, including health check scripts
- **review-ai/**: AI-powered code review tool using Aider with o3-mini model
- **instructions/**: AI assistant personas and instructions (poker advisor)
- **main.py**: Simple entry point for the project

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