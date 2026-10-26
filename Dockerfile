# Spanner Omni Pickleball Game - Airgapped Container Image
# Code Vipassana Season 16: Data & AI for Airgapped Systems
FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy and install python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set default environment variables for airgapped single-server mode
ENV PORT=5000 \
    SPANNER_EMULATOR_HOST=localhost:9010 \
    SPANNER_PROJECT=omni-demo \
    SPANNER_INSTANCE=omni-instance \
    SPANNER_DATABASE=pickleball-db \
    PYTHONUNBUFFERED=1

EXPOSE 5000

CMD ["python", "app.py"]
