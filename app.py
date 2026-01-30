import os
import torch
from TTS.api import TTS
import gradio as gr

# Allow XTTS config class for PyTorch checkpoint unpickling
torch.serialization.add_safe_globals(["TTS.tts.configs.xtts_config.XttsConfig"])

OUTPUT_DIR = "output"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Initialize TTS
tts = TTS(model_name="tts_models/multilingual/multi-dataset/xtts_v2", progress_bar=True)

def speak(text, speaker_wav, language):
    if speaker_wav is None:
        raise gr.Error("Upload your voice sample (samples/allan.wav).")
    out_path = os.path.join(OUTPUT_DIR, "allanvoice_output.wav")
    tts.tts_to_file(
        text=text,
        speaker_wav=speaker_wav,
        language=language,
        file_path=out_path
    )
    return out_path

demo = gr.Interface(
    fn=speak,
    inputs=[
        gr.Textbox(label="Text to speak", lines=5),
        gr.Audio(label="Upload your voice sample", type="filepath"),
        gr.Dropdown(choices=["en","es","fr","de","it","pt"], value="en", label="Language"),
    ],
    outputs=gr.Audio(label="AllanVoice Output"),
    title="AllanVoice (XTTS v2 - Open Source)",
)

if __name__ == "__main__":
    demo.launch(server_name="127.0.0.1", server_port=7860)
