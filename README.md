# python-dev – Dockerized Python Development Environment

## Introduction

This repository is a lightweight template for a reproducible Python development environment using Docker and VS Code Dev Containers. It is pre-configured to optionally leverage an NVIDIA GPU when available, so you can work on data science, ML, or general Python projects without polluting your host system.

**New Feature**: This environment now includes a browser-accessible desktop GUI, allowing you to run graphical Python applications (like matplotlib, tkinter, PyQt, etc.) directly in your browser without needing X11 forwarding or VNC clients.

## Prerequisite

Before using this repository, you need to have the following installed on your system:

- Docker Desktop
- VSCode with Dev Container extension installed
- Alternative: Remote Repositories extension of VSCode

## Key Features

* **Browser-Based GUI**: Access a full Linux desktop environment directly in your browser for running GUI applications
* **No Port Collisions**: Dynamic port mapping allows multiple instances without conflicts
* **NVIDIA GPU Support**: Pre-configured for GPU acceleration when available
* **Python Version Management**: Easy switching between Python versions using mise
* **Isolated Environment**: All dependencies are containerized, keeping your host system clean

## How to use

To use this repository, follow the steps below:

1. Create new repository by clicking the Use this template button above.
2. Open your duplicated repository in VSCode using the command ">Dev Containers: Clone Repositories in Named Container Volume". You can name your container for easy referencing.

## mise and py-init

This devcontainer uses "mise" (a small environment/tool manager) and a convenience shell helper named `py-init` to quickly create a mise-managed Python environment and a project virtualenv.

Quick usage
- Open a new shell and cd into your project directory.
- Run:
  - py-init 3.11
  - or any supported version (e.g. py-init 3.10, py-init 3.13)

What py-init does
- Creates/updates a local mise.toml in the current directory.
- Uses mise to select the requested Python version.
- Configures the local virtualenv path to .venv and enables automatic creation.

## Browser GUI Desktop

This development environment includes a browser-accessible desktop GUI for running graphical Python applications.

### Accessing the Desktop

When you open the container in VS Code:

1. **Automatic Access**: VS Code will automatically forward port 6080 and open the desktop in your browser
2. **Manual Access**: 
   - Look at the **PORTS** tab in VS Code's bottom panel
   - Find port **6080** labeled **"Desktop GUI"**
   - Click the **globe icon** (🌐) to open it in your browser

### Using GUI Applications

The browser desktop allows you to run any graphical Python application:

**Example: Matplotlib**
```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.figure(figsize=(10, 6))
plt.plot(x, y)
plt.title('Sine Wave')
plt.xlabel('X')
plt.ylabel('Y')
plt.grid(True)
plt.show()
```

**Example: Tkinter**
```python
import tkinter as tk

root = tk.Tk()
root.title("Hello Python GUI")
root.geometry("300x200")

label = tk.Label(root, text="Hello from Python!", font=("Arial", 16))
label.pack(pady=50)

button = tk.Button(root, text="Click Me", command=lambda: label.config(text="Button Clicked!"))
button.pack()

root.mainloop()
```

Run these scripts in the VS Code terminal, and the GUI windows will appear in your browser desktop tab.

### Desktop Features

* Full Linux desktop environment (XFCE)
* Window management (minimize, maximize, close)
* File manager
* Terminal applications
* Clipboard support (with some limitations)

### Tips for GUI Development

1. **Keep Browser Tab Open**: Keep the browser desktop tab open while developing GUI applications
2. **Multiple Windows**: You can open multiple application windows simultaneously
3. **Full Screen Mode**: Use F11 in most browsers for full-screen mode
4. **Zoom Controls**: Use browser zoom (Ctrl/Cmd + Plus/Minus) to adjust display size
