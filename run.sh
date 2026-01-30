#!/bin/bash

# 1️⃣ Activate virtual environment
source .venv/bin/activate

# 2️⃣ Force PyTorch to ignore weights_only restriction (Option 1)
export TORCH_FORCE_NO_WEIGHTS_ONLY_LOAD=1

# 3️⃣ Run Python code inline
python3 - <<PYTHON_EOF
import torch
from TTS.tts.configs.xtts_config import XttsConfig
from TTS.tts.models.xtts import XttsAudioConfig

# Optional: extra safety allowlist for XTTS globals
torch.serialization.add_safe_globals([XttsConfig, XttsAudioConfig])

from TTS.api import TTS
import gradio as gr

# Initialize XTTS
tts = TTS(model_name="tts_models/multilingual/multi-dataset/xtts_v2", progress_bar=True)

# Gradio interface
def tts_func(text):
    output_path = "output.wav"
    tts.tts_to_file(text=text, file_path=output_path)
    return output_path

iface = gr.Interface(fn=tts_func, inputs="text", outputs="audio", title="AllanVoice XTTS")
iface.launch(share=True)
PYTHON_EOF
