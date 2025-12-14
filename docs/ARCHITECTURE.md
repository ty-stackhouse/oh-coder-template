# Project Architecture

## Design Principles

1. **Test-Driven Development**: Tests are specifications. Code implements tests.
2. **Separation of Concerns**: Each module does one thing well.
3. **Type Safety**: Type hints on public APIs enable IDE support and catch errors early.
4. **Integration Testing**: Headless browser tests validate real user workflows.
5. **Architectural Coherence**: All PRs should maintain consistency with these principles.

## Directory Structure

- `src/`: All application code, organized by domain/feature
- `tests/test_unit/`: Unit tests for individual functions/classes
- `tests/test_integration/`: Browser-based integration tests (Playwright)
- `docs/`: Documentation including this architecture guide
- `.openhands/`: Skills, instructions, and microagent definitions

## When to Add Features

1. Create tests that define the feature behavior
2. Write code that passes those tests
3. Verify types with mypy
4. Run full test suite before requesting merge
5. Update this document if architecture changes

## Review Checklist for PRs

- [ ] Tests written for new code
- [ ] All tests pass: `uv run pytest`
- [ ] Types valid: `uv run mypy src/`
- [ ] Linting passes: `uv run ruff check .`
- [ ] Code formatted: `uv run ruff format .`
- [ ] No new dependencies added without reason
- [ ] Documentation updated if needed
