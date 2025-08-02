# AI Lab

A workspace for experimenting with AI-assisted development tools and AWS AI services.

## Project Structure

- `aider-bedrock/`: Integration with AWS Bedrock for the Aider AI coding assistant
- `review-ai/`: AI-assisted code review tools
- `instructions/`: Prompt templates and instructions for AI models

## Setup Instructions

### Creating a New Python Project

```bash
cd [working-dir]
uv init [project-name]
cd [project-name]
uv python install 3.12
uv venv --python 3.12
source .venv/bin/activate
```

### Setting Up This Repository

```bash
git clone https://github.com/junichiro/ailab.git
cd ailab
uv venv --python 3.12
source .venv/bin/activate
uv pip install -e .
```

## Tools

### Aider-Bedrock

AI-assisted coding using AWS Bedrock models with Aider.

### Review-AI

AI-powered code review tool to improve code quality.

## Development Guidelines

See [CONVENTIONS.md](./CONVENTIONS.md) for coding standards and best practices.

