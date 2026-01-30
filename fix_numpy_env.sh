#!/bin/bash

echo "=== Fix NumPy & Environment for TTS/Gradio ==="

# Upgrade pip, setuptools, wheel
pip install --upgrade pip setuptools wheel

# Step 0: Uninstall conflicting packages
pip uninstall -y numpy gradio gradio-client huggingface-hub transformers TTS pillow markupsafe

# Step 1: Install compatible versions
pip install numpy==2.3.5 --force-reinstall
pip install pandas==1.5.3 --force-reinstall
pip install huggingface-hub==0.36.0 --force-reinstall
pip install gradio==3.39.0 --force-reinstall
pip install gradio-client==0.3.1 --force-reinstall
pip install websockets==11.0.3 --force-reinstall
pip install TTS==0.22.0 --force-reinstall
pip install transformers==4.33.2 --force-reinstall
pip install pillow==10.4.0 --force-reinstall
pip install markupsafe==2.1.3 --force-reinstall

# Step 2: Reinstall supporting packages
pip install requests==2.32.5 typing-extensions==4.15.0 tqdm==4.67.1 pyyaml==6.0.3 packaging==26.0 certifi==2026.1.4 filelock==3.20.3 fsspec==2026.1.0

# Step 3: Sanity check - print versions
echo "=== Installed Package Versions ==="
pip list | grep -E "numpy|pandas|huggingface-hub|gradio|gradio-client|websockets|transformers|TTS|pillow|markupsafe"

echo "=== Environment Ready for TTS & Gradio ==="
