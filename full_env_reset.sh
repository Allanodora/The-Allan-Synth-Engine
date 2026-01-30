#!/bin/bash

echo "=== Full Clean Environment Reset for TTS & Gradio ==="

# 1️⃣ Delete old virtual environment
if [ -d ".venv" ]; then
    echo "Deleting old virtual environment..."
    rm -rf .venv
fi

# 2️⃣ Create new virtual environment
echo "Creating new virtual environment..."
python3 -m venv .venv

# 3️⃣ Activate environment
source .venv/bin/activate

# 4️⃣ Upgrade core tools
echo "Upgrading pip, setuptools, wheel..."
pip install --upgrade pip setuptools wheel

# 5️⃣ Install fully compatible versions
echo "Installing aligned packages..."
pip install \
    numpy==1.23.6 \
    pandas==1.5.3 \
    huggingface-hub==0.36.0 \
    gradio==3.39.0 \
    gradio-client==0.7.3 \
    websockets==11.0.3 \
    TTS==0.22.0 \
    transformers==4.33.2 \
    pillow==10.4.0 \
    markupsafe==2.1.3 \
    requests==2.32.5 \
    typing-extensions==4.15.0 \
    tqdm==4.67.1 \
    pyyaml==6.0.3 \
    packaging==26.0 \
    certifi==2026.1.4 \
    filelock==3.20.3 \
    fsspec==2026.1.0 \
    numba==0.63.1

# 6️⃣ Sanity check
echo "=== Installed Package Versions ==="
pip list | grep -E "numpy|pandas|huggingface-hub|gradio|gradio-client|websockets|transformers|TTS|pillow|markupsafe|numba"

echo "=== Environment Fully Cleaned, Aligned, & Ready ==="
