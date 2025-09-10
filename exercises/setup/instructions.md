# Setting Up Haskell for TDA555

This guide helps you set up a Haskell development environment for the course. The official recommendation is to use VS Code and Docker, but you can use your own editor and install GHC manually if you prefer. If you run into issues, ask for help in the #tech-support channel on Discord.

---

## 1. Install VS Code

VS Code is a free editor from Microsoft with great support for Haskell and remote development.

- **Windows:**
  - Go to https://code.visualstudio.com/
  - Download and run the installer.
- **MacOS:**
  - Go to https://code.visualstudio.com/
  - Download and run the installer.
  - Or follow: https://code.visualstudio.com/docs/setup/mac
- **Linux (Ubuntu):**
  - Go to https://code.visualstudio.com/Download
  - Download the .deb file
  - Run: `sudo apt install ./<file>.deb`
  - Or follow: https://code.visualstudio.com/docs/setup/linux
- **Other:**
  - See official docs or ask in #tech-support

---

## 2. Install Docker

Docker lets you run a container with all the tools you need for the course.

- **Windows:**
  - Go to https://docs.docker.com/desktop/windows/install/
  - Download and install Docker Desktop.
  - Restart your computer if needed.
  - Open Docker Desktop to start the backend.
- **MacOS:**
  - Go to https://docs.docker.com/desktop/mac/install/
  - Download the correct version for your chip (Intel or Apple Silicon).
  - Increase memory to 4GB or 8GB in Docker Desktop > Preferences > Resources if needed.
- **Linux (Ubuntu):**
  - Go to https://docs.docker.com/engine/install/ubuntu/
  - Follow the instructions.
- **Other:**
  - See official docs or ask in #tech-support

---

## 3. Running in a Container (Recommended)

1. Open VS Code
2. Choose 'Open Folder' and select your lab folder
3. When prompted, install the Remote - Containers extension
4. Click 'Reopen in Container' when prompted
5. Wait for the container to download and launch (first time may take a few minutes)
6. Open files and start editing
7. Open a terminal in VS Code to build and run your programs

You can reuse the container setup for other projects by copying the `.devcontainer` directory.

---

## Alternative: Manual Haskell Installation

You can install Haskell manually (recommended: https://www.haskell.org/ghcup/), but this may cause hard-to-debug issues, especially on Windows. Official support is for VS Code + Docker.

---

## Troubleshooting & Support

If you have problems, ask in the #tech-support channel on Discord. The course team will help as best they can, but support for manual setups may be limited.

---

## Your Own Guide

Below is a personal guide written by Guslof. Use it for extra tips and troubleshooting!

---

### Guslof's Haskell Setup Guide

> For a detailed guide on downloading Haskell, see: https://notes.guslof.se/share/C5eahfoZ15PL

- If you want to use your own editor, install GHC and Cabal/Stack manually.
- On Mac, you may need to allow apps from "identified developers" in System Preferences > Security & Privacy.
- If you get stuck, try searching for your error message online or ask in Discord.
- Always test your setup by running `ghci` in a terminal and loading a simple `.hs` file.
- If you use Docker, make sure it is running before opening VS Code.
- For VS Code, install the Haskell extension for syntax highlighting and error checking.

Good luck with your setup and the course!

