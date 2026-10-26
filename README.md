# Spanner Omni Pickleball Game 🏓
### *Data & AI for Airgapped Systems — Code Vipassana Season 16 Project Pioneer*

[![Google Cloud Spanner Omni](https://img.shields.io/badge/Google_Cloud-Spanner_Omni-4285F4?logo=googlecloud&logoColor=white)](https://cloud.google.com/spanner)
[![Gemini](https://img.shields.io/badge/Google-Gemini_AI-8E75B2?logo=google&logoColor=white)](https://ai.google.dev/)
[![Flask](https://img.shields.io/badge/Python-Flask-000000?logo=flask&logoColor=white)](https://flask.palletsprojects.com/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)

An interactive, visual **Pickleball Tactical Game Arena** demonstrating **On-Device Graph RAG** and distributed ACID consistency with **Google Cloud Spanner Omni** combined with **Google Gemini** for tactical coaching and real-time counter-shot prediction.

Built for **Code Vipassana Season 16: Data & AI for Airgapped Systems**.

---

## 🏛️ System Architecture

![Spanner Omni Pickleball System Architecture](architecture_diagram.png)

```mermaid
graph TD
    subgraph Client ["Client Layer"]
        UI["2.5D Animated Court Arena (60 FPS Canvas)"]
        Audio["Web Audio API Sound Synth Engine"]
        Deck["Tactical Control Deck (Dinks / Drops / Lobs)"]
    end

    subgraph Backend ["Application Layer (Flask / Python)"]
        Server["Flask Game Engine (app.py)"]
        Physics["Trajectory & Ball Physics Engine"]
        RAG["On-Device Graph RAG Pipeline"]
    end

    subgraph DataAI ["Data & AI Core"]
        Spanner["Google Cloud Spanner Omni<br/>(Airgapped / Single-Server Mode)"]
        Gemini["Google Gemini AI Coach<br/>(Grounding via Live Graph Telemetry)"]
    end

    UI -->|"Shot Inputs and Angle / Spin"| Server
    Server -->|"Logs Shot Nodes and TRANSITIONED_TO Edges"| Spanner
    Server -->|"Contextual Shot History Query"| RAG
    RAG -->|"Grounding Context"| Gemini
    Gemini -->|"Tactical Recommendations and OmniBot Counter"| Server
    Server -->|"Realtime 60FPS Coordinates and Audio Triggers"| UI
    Audio -.-> UI
```

---

## 🎮 Key Highlights & Features (Project Pioneer Major Evolutions)

- **🔥 Live Court Shot Heatmap & Fault Density Layer (ISO GQL Query)**:
  - Real-time radial heat gradient visualization directly on the 2.5D tournament court canvas.
  - Queries Spanner Omni Graph telemetry (`MATCH (s:Shot)-[:TRANSITIONED_TO]->(r:Shot)`) to highlight winner zones (emerald) and unforced error/fault clusters (orange/red) with live zone distribution analytics.
- **🧠 Adaptive OmniBot AI (On-Device Graph RAG Opponent)**:
  - Dynamically traverses historical shot and fault nodes in Spanner Omni to pinpoint the player's primary defensive vulnerability (e.g., weak backhand baseline returns, kitchen NVZ foot faults).
  - Actively adapts counter-shot coordinates in real-time to challenge the player's weaknesses.
- **🔊 Web Speech API Tactical Voice Coach**:
  - Live procedural speech synthesis speaking referee outcomes and Gemini tactical coaching feedback aloud during matches without external cloud TTS dependencies.
- **⏪ Vector Trajectory Rally Replay Scrubber**:
  - Step-by-step 3D quadratic bezier trajectory visualizer with numbered waypoint markers (`S1, S2, ...`) allowing players to review prior exchanges directly from Spanner.
- **2.5D Animated Visual Court Arena (60 FPS Canvas)**: Pure HTML5 Canvas rendering of a tournament court with 60 FPS wiffle ball trajectory physics, bounce detection, and kitchen line infractions.
- **On-Device Spanner Omni Graph Telemetry**: 
  - Every rally, shot, bounce, and counter-response is recorded as relational graph nodes (`s1:Shot`, `s2:Shot`) with `[:TRANSITIONED_TO]` edges in Spanner Omni.
  - Demonstrates enterprise airgapped transactional consistency and query speed without requiring external cloud DB dependencies.
- **Gemini Agentic Tactical Coach**:
  - Leverages live Spanner Omni telemetry to analyze opponent shot patterns, player positioning, and error rates.
  - Generates tactical coaching adjustments (e.g., target backhand kitchen corner, reduce attack angle).
- **Web Audio API Effects**:
  - Dynamic audio synthesized in real time (paddle pops, court bounce thuds, and speedup swooshes).
- **Four Distinct Shot Categories**:
  - Kitchen Soft Dinks, 3rd-Shot Drops, Shoulder Speedups, and Defensive Lobs.

---

## 📂 Project Structure

```
pickleball/
├── app.py                  # Flask backend, Spanner transactions & Gemini AI integration
├── requirements.txt        # Python dependencies
├── Dockerfile              # Container definition for airgapped deployment
├── start.sh                # Automated bootstrap script
├── .env.example            # Environment variables template
├── .gitignore              # Git ignore rules for safety
├── README.md               # Architecture, features, and setup documentation
└── templates/
    └── index.html          # 2.5D visual animated court arena & control deck
```

---

## 🚀 Quick Start Guide

### 1. Install Dependencies
```bash
pip install -r requirements.txt
```

### 2. Configure Environment
Copy `.env.example` to `.env`:
```bash
cp .env.example .env
```
Set your `GEMINI_API_KEY` and Spanner parameters if needed.

### 3. Run Spanner Omni (Docker)
```bash
# Create persistent storage volume
docker volume create spanner_omni_data

# Pull Spanner Omni image
docker pull us-docker.pkg.dev/spanner-omni/images/spanner-omni:2026.r2.1-beta

# Run Spanner Omni in single-server mode
docker run -d --name spanner-omni \
  -p 9010:9010 -p 9020:9020 \
  -v spanner_omni_data:/spanner \
  us-docker.pkg.dev/spanner-omni/images/spanner-omni:2026.r2.1-beta \
  start-single-server
```

### 4. Launch the Game Arena
```bash
python app.py
```
Open your browser at `http://localhost:5000` (or the Google Cloud Shell Web Preview on port 5000).

---

## 👨‍💻 Author
- **Snehal Ghadge**
- Code Vipassana Season 16: *Data & AI for Airgapped Systems*
