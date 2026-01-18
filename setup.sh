#!/bin/bash

# Exit on any error
set -e

echo "🚀 Starting setup..."

# 1. Install Astral uv
echo "📦 Installing Astral uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# 2. Install Kilocode CLI
echo "📦 Installing Kilocode CLI..."
npm install -g @kilocode/cli

# 3. Update PATH in .bashrc if not already present
PATH_LINE='export PATH="$(npm config get prefix)/bin:$PATH"'
if ! grep -Fxq "$PATH_LINE" ~/.bashrc; then
    echo "$PATH_LINE" >> ~/.bashrc
    echo "✅ Added npm bin to PATH in .bashrc"
fi

# Manually export PATH for this session so the rest of the script works
export PATH="$(npm config get prefix)/bin:$PATH"

# 4. Create Skill Directories
echo "📁 Creating skill directories..."
mkdir -p ~/.kilocode/skills/uv-specialist \
         ~/.kilocode/skills/frontend-specialist \
         ~/.kilocode/skills/nano-banana

# 5. Create UV Specialist Skill
echo "📝 Writing uv-specialist/SKILLS.md..."
cat << 'EOF' > ~/.kilocode/skills/uv-specialist/SKILLS.md
---
name: uv-specialist
description: Use Astral uv to create Python environments and manage dependencies for scripts and projects.
---

# Astral uv workflow

## When to use this skill

Use this skill when the user asks for help with any of the following:

1. Creating a Python environment with uv
2. Installing Python libraries with uv
3. Managing dependencies via pyproject.toml using uv
4. Running commands inside a uv managed environment
5. Verifying or diagnosing uv installation paths

## Defaults

1. Prefer a project workflow when a repository or long lived folder exists.
2. Prefer a virtual environment when the goal is short lived or experimental.
3. Prefer declared dependencies for repeatable work.

## uv installation context

On this system, uv is installed in the user local bin directory.

When the user runs:

which uv

The expected output is:

/home/sprite/.local/bin/uv

## Virtual environment workflow

### Create an environment
Command: uv venv

### Install libraries into the environment
uv pip install requests

## Project workflow
uv init
uv add requests
uv run python
EOF

# 6. Create Frontend Specialist Skill
echo "📝 Writing frontend-specialist/SKILLS.md..."
cat << 'EOF' > ~/.kilocode/skills/frontend-specialist/SKILLS.md
---
name: frontend-specialist
description: Create distinctive, production-grade frontend interfaces with high design quality. 
---
This skill guides creation of distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics.
EOF

# 7. Create Nano Banana Skill
echo "📝 Writing nano-banana/SKILLS.md..."
cat << 'EOF' > ~/.kilocode/skills/nano-banana/SKILLS.md
---
name: nano-banana
description: REQUIRED for all image generation requests. Generate and edit images using Nano Banana (Gemini CLI).
allowed-tools: Bash(gemini:*)
---
# Nano Banana Image Generation
Generate professional images via the Gemini CLI's nanobanana extension.
EOF

# 8. Finalize
echo "✨ Setup complete! Refreshing bashrc..."
source ~/.bashrc

echo "✅ All done. You can now use 'kilo' and 'uv' commands."
