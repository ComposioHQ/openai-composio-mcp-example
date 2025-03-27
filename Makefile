.PHONY: setup install clean run lint format help

# Python version and virtual environment paths
VENV_DIR = .venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
UV = $(shell which uv)

help:
	@echo "Available commands:"
	@echo "  make setup    - Install uv and create virtual environment"
	@echo "  make install  - Install project dependencies using uv"
	@echo "  make clean    - Remove virtual environment and cache files"
	@echo "  make run      - Run the agent"
	@echo "  make lint     - Run linter (ruff)"
	@echo "  make format   - Format code (black)"

setup:
	@echo "Installing uv if not already installed..."
	@command -v uv >/dev/null 2>&1 || pip install uv
	@echo "Creating virtual environment..."
	@uv venv $(VENV_DIR)

install: setup
	@echo "Installing dependencies with uv..."
	@$(UV) pip install -r requirements.txt
	@echo "Installing development dependencies..."
	@$(UV) pip install black ruff
	@echo "Installing Node.js dependencies..."
	@command -v npm >/dev/null 2>&1 && npm install -g @modelcontextprotocol/server-filesystem || echo "Please install Node.js to use the filesystem server"

clean:
	@echo "Cleaning up..."
	@rm -rf $(VENV_DIR)
	@rm -rf __pycache__
	@rm -rf *.egg-info
	@rm -rf .pytest_cache
	@rm -rf .ruff_cache
	@rm -rf .coverage
	@find . -type d -name "__pycache__" -exec rm -r {} +
	@find . -type f -name "*.pyc" -delete
	@find . -type f -name "*.pyo" -delete
	@find . -type f -name "*.pyd" -delete
	@echo "Cleanup complete!"

run:
	@echo "Running agent..."
	@$(PYTHON) agent.py

lint:
	@echo "Running linter..."
	@$(PYTHON) -m ruff check .

format:
	@echo "Formatting code..."
	@$(PYTHON) -m black .

# Ensure virtual environment exists before running certain commands
run lint format: $(VENV_DIR)

$(VENV_DIR):
	@echo "Virtual environment not found. Running setup..."
	@$(MAKE) setup
	@$(MAKE) install 