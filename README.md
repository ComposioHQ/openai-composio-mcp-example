# OpenAI Agent with MCP

This is a simple example of using OpenAI Agents SDK with Model Context Protocol (MCP), using `uv` for Python dependency management.

## Setup

1. Install uv:```bash
pip install uv
```

2. Create and activate a virtual environment with uv:
```bash
uv venv
source .venv/bin/activate  # On Unix/macOS
# OR
.venv\Scripts\activate  # On Windows
```

3. Install Python dependencies with uv:
```bash
uv pip install -r requirements.txt
```

4. Install Node.js dependencies (for MCP filesystem server):
```bash
npm install -g @modelcontextprotocol/server-filesystem
```

5. Create a `.env` file and add your OpenAI API key:
```bash
OPENAI_API_KEY=your_openai_api_key_here
COMPSOIO_MCP_SSE_URL=<YOUR_MCP_SERVER>
```

## Usage

Run the agent:
```bash
python agent.py
```

The agent will:
1. Connect to the MCP filesystem server
2. List all files in the current directory
3. Create a new file called 'hello.txt'

## How it works

The agent uses the OpenAI Agents SDK with MCP integration to:
- Initialize an OpenAI model (GPT-4)
- Set up an MCP filesystem server
- Create an agent that can interact with the filesystem
- Execute filesystem operations based on natural language commands

## Customization

You can modify the agent's instructions and tasks in `agent.py`. The agent can:
- List directory contents
- Create, read, update, and delete files
- Navigate the filesystem
- And more!

## Why uv?

We use `uv` because it offers several advantages:
- Faster package installation (up to 10-100x faster than pip)
- Built-in virtual environment management
- Deterministic builds with precise dependency resolution
- Native compilation of wheels
- Better security with supply chain attack prevention 
