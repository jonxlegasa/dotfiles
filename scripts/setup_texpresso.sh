#!/usr/bin/env bash
set -euo pipefail

TEXPRESSO_SRC_DIR="${TEXPRESSO_SRC_DIR:-$HOME/.local/src/texpresso}"
LOCAL_BIN_DIR="${LOCAL_BIN_DIR:-$HOME/.local/bin}"

echo "Setting up TeXpresso..."

echo "Installing Neovim plugins, including texpresso.vim..."
if command -v nvim >/dev/null 2>&1; then
  nvim --headless "+Lazy! sync" +qa
else
  echo "nvim is not installed yet; skipping Lazy.nvim plugin sync."
fi

echo "Installing TeXpresso system dependencies..."
if command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --needed \
    base-devel \
    fontconfig \
    freetype2 \
    gcc-libs \
    git \
    glibc \
    graphite \
    gumbo-parser \
    harfbuzz \
    icu \
    jbig2dec \
    libjpeg-turbo \
    libmupdf \
    libpng \
    openjpeg2 \
    openssl \
    sdl2-compat \
    tectonic \
    zlib
elif command -v brew >/dev/null 2>&1; then
  brew install mupdf-tools sdl2 tectonic
else
  echo "No supported package manager found. Install TeXpresso dependencies manually, then rerun this script."
  exit 1
fi

echo "Cloning or updating TeXpresso source..."
if [ -d "$TEXPRESSO_SRC_DIR/.git" ]; then
  git -C "$TEXPRESSO_SRC_DIR" pull --ff-only
  git -C "$TEXPRESSO_SRC_DIR" submodule update --init --recursive
else
  mkdir -p "$(dirname "$TEXPRESSO_SRC_DIR")"
  git clone --recurse-submodules https://github.com/let-def/texpresso.git "$TEXPRESSO_SRC_DIR"
fi

echo "Building TeXpresso..."
make -C "$TEXPRESSO_SRC_DIR" all

echo "Installing TeXpresso launcher into $LOCAL_BIN_DIR..."
mkdir -p "$LOCAL_BIN_DIR"
cat > "$LOCAL_BIN_DIR/texpresso" <<EOF
#!/usr/bin/env sh
exec "$TEXPRESSO_SRC_DIR/build/texpresso" "\$@"
EOF
chmod +x "$LOCAL_BIN_DIR/texpresso"

if [ -x "$TEXPRESSO_SRC_DIR/build/texpresso-xetex" ]; then
  cat > "$LOCAL_BIN_DIR/texpresso-xetex" <<EOF
#!/usr/bin/env sh
exec "$TEXPRESSO_SRC_DIR/build/texpresso-xetex" "\$@"
EOF
  chmod +x "$LOCAL_BIN_DIR/texpresso-xetex"
fi

echo "TeXpresso setup finished. Make sure $LOCAL_BIN_DIR is on PATH before launching Neovim."
