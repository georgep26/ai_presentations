#!/bin/bash

# Quarto Installation Script
# Detects OS and installs Quarto using the appropriate method

set -e

detect_os() {
    case "$(uname -s)" in
        Darwin*)
            echo "macos"
            ;;
        Linux*)
            echo "linux"
            ;;
        MINGW*|MSYS*|CYGWIN*)
            echo "windows"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

install_quarto_macos() {
    echo "Detected macOS. Installing Quarto via Homebrew..."
    
    if ! command -v brew &> /dev/null; then
        echo "Error: Homebrew is not installed."
        echo "Please install Homebrew first: https://brew.sh"
        exit 1
    fi
    
    brew install quarto
    echo "Quarto installed successfully via Homebrew!"
}

install_quarto_windows() {
    echo "Detected Windows. Installing Quarto via Chocolatey..."
    
    if ! command -v choco &> /dev/null; then
        echo "Error: Chocolatey is not installed."
        echo "Please install Chocolatey first: https://chocolatey.org/install"
        exit 1
    fi
    
    choco install quarto -y
    echo "Quarto installed successfully via Chocolatey!"
}

install_quarto_linux() {
    echo "Detected Linux. Installing Quarto via tarball..."
    
    # Get the latest version
    QUARTO_VERSION=$(curl -s https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    
    if [ -z "$QUARTO_VERSION" ]; then
        echo "Error: Could not determine latest Quarto version."
        exit 1
    fi
    
    echo "Installing Quarto version: $QUARTO_VERSION"
    
    # Detect architecture
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64)
            QUARTO_ARCH="amd64"
            ;;
        aarch64|arm64)
            QUARTO_ARCH="arm64"
            ;;
        *)
            echo "Error: Unsupported architecture: $ARCH"
            exit 1
            ;;
    esac
    
    # Download and install
    QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/${QUARTO_VERSION}/quarto-${QUARTO_VERSION#v}-linux-${QUARTO_ARCH}.tar.gz"
    TEMP_DIR=$(mktemp -d)
    
    echo "Downloading Quarto from: $QUARTO_URL"
    curl -L "$QUARTO_URL" -o "$TEMP_DIR/quarto.tar.gz"
    
    echo "Extracting Quarto..."
    tar -xzf "$TEMP_DIR/quarto.tar.gz" -C "$TEMP_DIR"
    
    # Install to /usr/local (requires sudo)
    echo "Installing Quarto to /usr/local (requires sudo)..."
    sudo mkdir -p /usr/local
    sudo mv "$TEMP_DIR/quarto-${QUARTO_VERSION#v}"/* /usr/local/
    
    # Cleanup
    rm -rf "$TEMP_DIR"
    
    # Add to PATH if not already there
    if ! echo "$PATH" | grep -q "/usr/local/bin"; then
        echo ""
        echo "Note: /usr/local/bin may not be in your PATH."
        echo "Add this to your ~/.bashrc or ~/.zshrc:"
        echo "  export PATH=\"/usr/local/bin:\$PATH\""
    fi
    
    echo "Quarto installed successfully!"
}

# Main installation logic
OS=$(detect_os)

case "$OS" in
    macos)
        install_quarto_macos
        ;;
    windows)
        install_quarto_windows
        ;;
    linux)
        install_quarto_linux
        ;;
    *)
        echo "Error: Unsupported operating system."
        echo "Please install Quarto manually from: https://quarto.org/docs/get-started/"
        exit 1
        ;;
esac

# Verify installation
echo ""
echo "Verifying installation..."
if command -v quarto &> /dev/null; then
    quarto --version
    echo ""
    echo "Quarto installation complete!"
else
    echo "Warning: Quarto command not found in PATH."
    echo "You may need to restart your terminal or add Quarto to your PATH."
fi

