import warnings
warnings.filterwarnings("ignore")

import torch
import gradio as gr
from TTS.api import TTS
from TTS.tts.configs.xtts_config import XttsConfig

# 1. PyTorch 2.6+ Security Patch
if hasattr(torch.serialization, 'add_safe_globals'):
    torch.serialization.add_safe_globals([XttsConfig])

# 2. Force CPU Mode for M3 Stability
# M3 chips often hit channel limits on MPS for XTTS's decoder
device = "cpu"
print(f"--- Running on M3 CPU (Stable Mode) ---")

# 3. Load XTTS v2
model_name = "tts_models/multilingual/multi-dataset/xtts_v2"
tts = TTS(model_name).to(device)

# 4. Synthesize Function
def synthesize(text, ref_audio, speed):
    if not ref_audio or not text:
        return None
    
    output_path = "output.wav"
    try:
        tts.tts_to_file(
            text=text,
            speaker_wav=ref_audio,
            language="en",
            file_path=output_path,
            speed=speed
        )
        return output_path
    except Exception as e:
        print(f"Error during synthesis: {e}")
        return None

# 5. Simple interface
with gr.Blocks(title="M3 XTTS Voice Synth") as iface:
    gr.Markdown("# 🎙️ The Allan-Synth Engine")
    gr.Markdown("Using XTTS v2 on CPU for maximum stability.")
    
    with gr.Row():
        with gr.Column():
            txt = gr.Textbox(label="Text to Speak", placeholder="Type here...", lines=4)
            ref = gr.Audio(label="Clone Reference (WAV/MP3)", type="filepath")
            spd = gr.Slider(label="Speed", minimum=0.5, maximum=2.0, step=0.1, value=1.0)
            btn = gr.Button("🚀 GENERATE CLONE", variant="primary")
        
        with gr.Column():
            audio_out = gr.Audio(label="Generated Result")

    btn.click(synthesize, inputs=[txt, ref, spd], outputs=audio_out)

if __name__ == "__main__":
    iface.launch()
