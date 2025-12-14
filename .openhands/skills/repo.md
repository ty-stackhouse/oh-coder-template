# Repository Architecture and Standards

## Purpose
This repository uses OpenHands resolver with AI-driven development, test-driven development (TDD), and multi-agent specialization to minimize manual coding while maximizing code quality and architectural coherence.

## Setup & Installation
- **Language**: Python (see `.python-version` for exact version)
- **Package Manager**: uv (https://docs.astral.sh/uv/)
- **Installation**: `uv sync --all-extras`
- **Dependencies**: See `pyproject.toml` for all dependencies

## Repository Structure
```
project-root/
├── src/                          # Main application code
│   └── __init__.py
├── tests/                        # Test suite (ALWAYS REQUIRED)
│   ├── __init__.py
│   ├── test_unit/               # Unit tests
│   └── test_integration/        # Integration tests (browser-based)
├── .openhands/
│   └── skills/
│       └── repo.md              # This file
├── docs/
│   ├── ARCHITECTURE.md          # Design and principles
│   └── DEVELOPMENT.md           # Developer guide
├── .github/workflows/           # CI/CD workflows
├── pyproject.toml              # Project configuration
├── .python-version             # Python version specification
└── README.md                   # Project documentation
```

## Core Principles (NON-NEGOTIABLE)

### 1. Test-Driven Development is Mandatory
- **All features require corresponding tests BEFORE implementation**
- Tests are the source of truth for requirements
- Unit tests live in `tests/test_unit/`
- Integration tests (browser tests) live in `tests/test_integration/`
- Run with: `uv run pytest`

### 2. Separation of Concerns
- Each module/file has ONE clear responsibility
- Imports are organized (stdlib, third-party, local)
- No circular dependencies
- Functions <50 lines when possible

### 3. Type Safety
- All public APIs must have type hints
- Run `uv run mypy src/` to validate
- Internal functions may have hints for clarity

### 4. Code Quality Standards
- Format: `uv run ruff format .`
- Lint: `uv run ruff check . --fix`
- Line length: 100 characters (configured in pyproject.toml)

## GitHub Workflows & CI
The repository includes automated workflows:
- **openhands-resolver.yml**: Triggered by `@openhands-agent` comments or `fix-me` label
- **Tests**: Run on all PRs, must pass before merge
- Environment variables available to resolver: See GitHub Secrets

## Agent Specialization (Microagents)
When requesting specific tasks, include these in your issue comment:
- `/backend` - Backend/API development
- `/test` - Test writing and improvement
- `/frontend` - Frontend code (if applicable)
- `/docs` - Documentation updates
- `/architect` - Architecture review

## Dependencies & Adding Packages
- Production: `uv add package-name`
- Development: `uv add --group dev package-name`
- Always check if dependencies align with project goals

## Testing Guidelines
- **Coverage target**: >80% for critical paths
- Use pytest fixtures for setup/teardown
- Integration tests use Playwright for headless browser testing
- Async tests use `@pytest.mark.asyncio`
- Mock external services, never make real API calls in tests

## Common Commands
```
# Install all dependencies
uv sync --all-extras

# Run all tests
uv run pytest

# Run specific test file
uv run pytest tests/test_unit/test_file.py

# Run with coverage
uv run pytest --cov

# Format code
uv run ruff format .

# Lint and auto-fix
uv run ruff check . --fix

# Type check
uv run mypy src/
```

## Design Validation
Before implementing large features:
1. Check if design aligns with ARCHITECTURE.md goals
2. Ensure tests clearly define expected behavior
3. Consider integration points with existing code
4. Verify no contradictions with other PR changes

## What NOT to Do
- Don't modify tests without discussing scope change
- Don't add dependencies without valid reason
- Don't skip type hints on public APIs
- Don't commit TODO comments (convert to GitHub issues instead)
- Don't add code that can't be tested
```

