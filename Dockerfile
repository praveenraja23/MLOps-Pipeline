# syntax=docker/dockerfile:1
# Multi-stage build: install dependencies once, copy only what's needed at runtime.

# --------------- Builder ---------------
FROM python:3.12-slim AS builder

WORKDIR /build

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# --------------- Runtime ---------------
FROM python:3.12-slim AS runtime

WORKDIR /app

# Install runtime system deps (libgomp for LightGBM/XGBoost parallelism)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgomp1 \
    && rm -rf /var/lib/apt/lists/*

# Copy installed packages from builder
COPY --from=builder /root/.local /root/.local

# Make sure scripts in .local are usable
ENV PATH=/root/.local/bin:$PATH

# Copy application code
COPY app/ app/
COPY src/ src/
COPY configs/ configs/
COPY config.yaml .
COPY params.yaml .
COPY scripts/ scripts/
COPY models/ models/

# Ensure data/raw exists for potential dataset generation
RUN mkdir -p data/raw data/ingested artifacts

# Expose the API port
EXPOSE 8000

# Run the FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]