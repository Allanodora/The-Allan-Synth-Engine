#!/bin/bash

echo "=== Aggressive Environment Reset & Reinstall ==="

# Upgrade pip, setuptools, wheel first
pip install --upgrade pip setuptools wheel

# Step 0: Uninstall conflicting packages completely
pip uninstall -y numpy pandas huggingface-hub gradio gradio-client websockets TTS transformers

# Step 1: Install compatible versions
pip install numpy==1.26.4 --force-reinstall
pip install pandas==1.5.3 --force-reinstall
pip install huggingface-hub==0.18.1 --force-reinstall
pip install gradio==3.39.0 --force-reinstall
pip install gradio-client==0.3.1 --force-reinstall
pip install websockets==11.0.3 --force-reinstall
pip install TTS==0.22.0 --force-reinstall
pip install transformers==4.33.2 --force-reinstall

# Step 2: Optional – reinstall supporting packages to resolve dependency warnings
pip install requests==2.32.5 typing-extensions==4.15.0 tqdm==4.67.1 pyyaml==6.0.3 packaging==26.0 certifi==2026.1.4 filelock==3.20.3 fsspec==2026.1.0

# Step 3: Sanity check - print versions
echo "=== Installed Package Versions ==="
pip list | grep -E "numpy|pandas|huggingface-hub|gradio|gradio-client|websockets|transformers|TTS"

echo "=== Environment Fully Reset & Aligned ==="
