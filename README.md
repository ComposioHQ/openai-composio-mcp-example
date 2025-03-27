# OpenAI Agent with MCP

This is a simple example of using OpenAI Agents SDK with Composio MCP, using `uv` for Python dependency management.

## Setup

1. Install uv:
```bash
pip install uv
```

2. Create and activate a virtual environment with uv:
```bash
uv venv
```

3. Install Python dependencies with uv:
```bash
uv pip install -r requirements.txt
```

4. Create a `.env` file and add your OpenAI API key:
```bash
OPENAI_API_KEY=your_openai_api_key_here
COMPSOIO_MCP_SSE_URL=<YOUR_MCP_SERVER>
```

Get the MCP URL from https://mcp.composio.dev (this example is for Gmail MCP server)

## Usage

Run the agent:
```bash
uv run agent.py
```

The agent will:
1. Connect to the Composio MCP Server
2. Ask to fetch all the emails and summarise them

## How it works

The agent uses the OpenAI Agents SDK with MCP integration to:
- Initialize an OpenAI model (GPT-4)
- Create an agent to Composio MCP Server with the SSE Link
- List and summarise all the recent emails