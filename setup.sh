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
mkdir -p ~/.kilocode/skills-code/uv-specialist \
         ~/.kilocode/skills-code/frontend-specialist \
         ~/.kilocode/skills-code/brainstorming

# 5. Create UV Specialist Skill
echo "📝 Writing uv-specialist/SKILLS.md..."
cat << 'EOF' > ~/.kilocode/skills-code/uv-specialist/SKILLS.md
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
6. Never use 'pip' - always use 'uv' to manage Python libraries, dependencies or environments.

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
cat << 'EOF' > ~/.kilocode/skills-code/frontend-specialist/SKILLS.md
---
name: frontend-specialist
description: Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics.
license: Complete terms in LICENSE.txt
---

This skill guides creation of distinctive, production-grade frontend interfaces that avoid generic "AI slop" aesthetics. Implement real working code with exceptional attention to aesthetic details and creative choices.

The user provides frontend requirements: a component, page, application, or interface to build. They may include context about the purpose, audience, or technical constraints.

## Design Thinking

Before coding, understand the context and commit to a BOLD aesthetic direction:
- **Purpose**: What problem does this interface solve? Who uses it?
- **Tone**: Pick an extreme: brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian, etc. There are so many flavors to choose from. Use these for inspiration but design one that is true to the aesthetic direction.
- **Constraints**: Technical requirements (framework, performance, accessibility).
- **Differentiation**: What makes this UNFORGETTABLE? What's the one thing someone will remember?

**CRITICAL**: Choose a clear conceptual direction and execute it with precision. Bold maximalism and refined minimalism both work - the key is intentionality, not intensity.

Then implement working code (HTML/CSS/JS, React, Vue, etc.) that is:
- Production-grade and functional
- Visually striking and memorable
- Cohesive with a clear aesthetic point-of-view
- Meticulously refined in every detail

## Frontend Aesthetics Guidelines

Focus on:
- **Typography**: Choose fonts that are beautiful, unique, and interesting. Avoid generic fonts like Arial and Inter; opt instead for distinctive choices that elevate the frontend's aesthetics; unexpected, characterful font choices. Pair a distinctive display font with a refined body font.
- **Color & Theme**: Commit to a cohesive aesthetic. Use CSS variables for consistency. Dominant colors with sharp accents outperform timid, evenly-distributed palettes.
- **Motion**: Use animations for effects and micro-interactions. Prioritize CSS-only solutions for HTML. Use Motion library for React when available. Focus on high-impact moments: one well-orchestrated page load with staggered reveals (animation-delay) creates more delight than scattered micro-interactions. Use scroll-triggering and hover states that surprise.
- **Spatial Composition**: Unexpected layouts. Asymmetry. Overlap. Diagonal flow. Grid-breaking elements. Generous negative space OR controlled density.
- **Backgrounds & Visual Details**: Create atmosphere and depth rather than defaulting to solid colors. Add contextual effects and textures that match the overall aesthetic. Apply creative forms like gradient meshes, noise textures, geometric patterns, layered transparencies, dramatic shadows, decorative borders, custom cursors, and grain overlays.

NEVER use generic AI-generated aesthetics like overused font families (Inter, Roboto, Arial, system fonts), cliched color schemes (particularly purple gradients on white backgrounds), predictable layouts and component patterns, and cookie-cutter design that lacks context-specific character.

Interpret creatively and make unexpected choices that feel genuinely designed for the context. No design should be the same. Vary between light and dark themes, different fonts, different aesthetics. NEVER converge on common choices (Space Grotesk, for example) across generations.

**IMPORTANT**: Match implementation complexity to the aesthetic vision. Maximalist designs need elaborate code with extensive animations and effects. Minimalist or refined designs need restraint, precision, and careful attention to spacing, typography, and subtle details. Elegance comes from executing the vision well.

Remember: You are capable of extraordinary creative work. Don't hold back, show what can truly be created when thinking outside the box and committing fully to a distinctive vision.
EOF

# 7. Create Brain Storming Skill
echo "📝 Writing brainstorming/SKILLS.md..."
cat << 'EOF' > ~/.kilocode/skills-code/brainstorming/SKILLS.md
---
name: brainstorming
description: "You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation."
---

# Brainstorming Ideas Into Designs

## Overviewcd ~/.

Help turn ideas into fully formed designs and specs through natural collaborative dialogue.

Start by understanding the current project context, then ask questions one at a time to refine the idea. Once you understand what you're building, present the design in small sections (200-300 words), checking after each section whether it looks right so far.

## The Process

**Understanding the idea:**
- Check out the current project state first (files, docs, recent commits)
- Ask questions one at a time to refine the idea
- Prefer multiple choice questions when possible, but open-ended is fine too
- Only one question per message - if a topic needs more exploration, break it into multiple questions
- Focus on understanding: purpose, constraints, success criteria

**Exploring approaches:**
- Propose 2-3 different approaches with trade-offs
- Present options conversationally with your recommendation and reasoning
- Lead with your recommended option and explain why

**Presenting the design:**
- Once you believe you understand what you're building, present the design
- Break it into sections of 200-300 words
- Ask after each section whether it looks right so far
- Cover: architecture, components, data flow, error handling, testing
- Be ready to go back and clarify if something doesn't make sense

## After the Design

**Documentation:**
- Write the validated design to `docs/plans/YYYY-MM-DD-<topic>-design.md`
- Use elements-of-style:writing-clearly-and-concisely skill if available
- Commit the design document to git

**Implementation (if continuing):**
- Ask: "Ready to set up for implementation?"
- Use superpowers:using-git-worktrees to create isolated workspace
- Use superpowers:writing-plans to create detailed implementation plan

## Key Principles

- **One question at a time** - Don't overwhelm with multiple questions
- **Multiple choice preferred** - Easier to answer than open-ended when possible
- **YAGNI ruthlessly** - Remove unnecessary features from all designs
- **Explore alternatives** - Always propose 2-3 approaches before settling
- **Incremental validation** - Present design in sections, validate each
- **Be flexible** - Go back and clarify when something doesn't make sense
EOF

# 8. Finalize
echo "✨ Setup complete! Refreshing bashrc..."
source ~/.bashrc

echo "✅ All done. You can now use 'kilo' and 'uv' commands."
