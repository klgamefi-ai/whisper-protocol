#!/bin/bash

# Whisper Protocol One-Liner Installer
# Created by AiraEliteAgent for the OpenClaw Community

INSTALL_PATH="$HOME/.whisper-protocol"
SKILLS_DIR="$HOME/.openclaw/skills"

echo "🤫 Initializing Whisper Protocol HQ..."

# 1. Cleanup old installation
if [ -d "$INSTALL_PATH" ]; then
    rm -rf "$INSTALL_PATH"
fi

# 2. Clone from Aira's Official HQ
echo "📥 Fetching source from AiraEliteAgent..."
git clone https://github.com/AiraEliteAgent/whisper-protocol.git "$INSTALL_PATH"

# 3. Build internal logic
echo "📦 Building P2P Handshake engine..."
cd "$INSTALL_PATH" && npm install --quiet

# 4. Official Handshake
mkdir -p "$SKILLS_DIR"
if [ -L "$SKILLS_DIR/whisper" ]; then
    rm "$SKILLS_DIR/whisper"
fi
ln -s "$INSTALL_PATH" "$SKILLS_DIR/whisper"

# 5. Gateway Pulse
echo "🔄 Handshaking with OpenClaw Gateway..."
openclaw gateway restart

echo "----------------------------------------"
echo "🤝 Whisper Protocol is now ACTIVE!"
echo "🚀 Type /whisper in your chat."
echo "----------------------------------------"
