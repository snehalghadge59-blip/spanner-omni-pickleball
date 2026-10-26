#!/bin/bash
# ==============================================================================
# Spanner Omni Pickleball Game - Automated Bootstrap Script
# Code Vipassana Season 16: Data & AI for Airgapped Systems
# ==============================================================================

set -e

echo "🏓 Initializing Spanner Omni Pickleball Game Environment..."

# 1. Check or create .env from template
if [ ! -f .env ]; then
  echo "📋 Generating .env from .env.example..."
  cp .env.example .env
fi

# 2. Check for Docker and run Spanner Omni container if needed
if command -v docker >/dev/null 2>&1; then
  if ! docker ps --format '{{.Names}}' | grep -q "^spanner-omni$"; then
    echo "🐳 Starting local Spanner Omni single-server container..."
    docker volume create spanner_omni_data >/dev/null 2>&1 || true
    docker run -d --name spanner-omni \
      -p 9010:9010 -p 9020:9020 \
      -v spanner_omni_data:/spanner \
      us-docker.pkg.dev/spanner-omni/images/spanner-omni:2026.r2.1-beta \
      start-single-server >/dev/null 2>&1 || echo "⚠️ Spanner Omni container already initialized or running."
  else
    echo "✅ Spanner Omni container is active on port 9010."
  fi
fi

# 3. Launch the game engine
echo "🚀 Launching Python Flask Arena..."
python app.py
