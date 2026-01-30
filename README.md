# 🎙️ The Allan-Synth Engine

A privacy-focused, 100% local voice cloning studio built for **Apple Silicon (M3)**.

## 🛠️ Engineering Hurdles Cleared
- **Environment Alignment**: Navigated complex versioning between Python 3.11, Numba, and NumPy 1.24 to support ARM architecture.
- **Hardware Stability**: Implemented stable CPU-mode inference to bypass Apple Silicon (MPS) convolution limits (65,536 channels).
- **Security Patching**: Handled PyTorch 2.6+ `weights_only` loading restrictions for custom XTTS configurations.

## ⚙️ How to Run
1. Ensure Python 3.11 is installed.
2. Run `source .venv/bin/activate`
3. Launch via `python run_xtts_gradio.py`
