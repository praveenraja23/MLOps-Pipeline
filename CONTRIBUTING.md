# Contributing to Churn Prediction MLOps Pipeline

Thank you for considering contributing! Here's how to get started.

## Development Setup

```bash
# Clone the repo
git clone <repo-url>
cd mlops-pipeline

# Create virtual environment
python -m venv .venv
source .venv/bin/activate  # or .venv\Scripts\activate on Windows

# Install dependencies
pip install -r requirements.txt

# Run the training pipeline
python -m src.pipeline.training_pipeline

# Start the API
python -m app.main
```

## Code Style

- **Formatting**: Black with 120-character line length
- **Imports**: isort with `profile=black`
- **Type hints**: Required for all public functions and methods
- **Docstrings**: Google-style docstrings for all modules, classes, and public functions

## Testing

```bash
# Run all tests
pytest -v

# Run only unit tests (faster)
pytest -v -m "not integration"

# Run integration tests
pytest -v -m integration
```

## Pull Request Process

1. Create a feature branch from `main`
2. Make your changes
3. Add or update tests as needed
4. Run the full test suite
5. Update documentation if needed
6. Submit a PR with a clear description

## Project Structure

```
mlops-pipeline/
├── app/              # FastAPI application (Stage 2)
├── src/              # Core ML pipeline (Stage 1)
├── scripts/          # Utility scripts
├── tests/            # Test suite
├── dashboard/        # Bootstrap 5 dashboard
├── monitoring/       # Prometheus + Grafana config
├── .github/          # CI/CD + templates
└── docs/             # Documentation
```

## Questions?

Open an issue with the `question` label.