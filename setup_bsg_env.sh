#!/bin/bash

# BSG Environment Setup Script
# This script sets up the BSG environment variables for the current shell session

# Get the absolute path to the BSG install directory
BSG_INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/install" && pwd)"

echo "Setting up BSG environment variables..."

# Set PATH to include BSG bin directory
if [[ ":$PATH:" != *":$BSG_INSTALL_DIR/bin:"* ]]; then
    export PATH="$BSG_INSTALL_DIR/bin:$PATH"
    echo "✓ Added $BSG_INSTALL_DIR/bin to PATH"
else
    echo "✓ $BSG_INSTALL_DIR/bin is already in PATH"
fi

# Set LD_LIBRARY_PATH (for Linux) and DYLD_LIBRARY_PATH (for macOS) to include BSG lib directory
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if [[ ":$DYLD_LIBRARY_PATH:" != *":$BSG_INSTALL_DIR/lib:"* ]]; then
        export DYLD_LIBRARY_PATH="$BSG_INSTALL_DIR/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
        echo "✓ Added $BSG_INSTALL_DIR/lib to DYLD_LIBRARY_PATH"
    else
        echo "✓ $BSG_INSTALL_DIR/lib is already in DYLD_LIBRARY_PATH"
    fi
else
    # Linux and other Unix-like systems
    if [[ ":$LD_LIBRARY_PATH:" != *":$BSG_INSTALL_DIR/lib:"* ]]; then
        export LD_LIBRARY_PATH="$BSG_INSTALL_DIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
        echo "✓ Added $BSG_INSTALL_DIR/lib to LD_LIBRARY_PATH"
    else
        echo "✓ $BSG_INSTALL_DIR/lib is already in LD_LIBRARY_PATH"
    fi
fi

# Set CPATH to include BSG include directory for C/C++ compilers
if [[ ":$CPATH:" != *":$BSG_INSTALL_DIR/include:"* ]]; then
    export CPATH="$BSG_INSTALL_DIR/include${CPATH:+:$CPATH}"
    echo "✓ Added $BSG_INSTALL_DIR/include to CPATH"
else
    echo "✓ $BSG_INSTALL_DIR/include is already in CPATH"
fi

# Set CMAKE_PREFIX_PATH for CMake to find BSG
if [[ ":$CMAKE_PREFIX_PATH:" != *":$BSG_INSTALL_DIR:"* ]]; then
    export CMAKE_PREFIX_PATH="$BSG_INSTALL_DIR${CMAKE_PREFIX_PATH:+:$CMAKE_PREFIX_PATH}"
    echo "✓ Added $BSG_INSTALL_DIR to CMAKE_PREFIX_PATH"
else
    echo "✓ $BSG_INSTALL_DIR is already in CMAKE_PREFIX_PATH"
fi

# Set BSG_DATA_DIR for BSG data files
export BSG_DATA_DIR="$BSG_INSTALL_DIR/data"
echo "✓ Set BSG_DATA_DIR to $BSG_DATA_DIR"

# Add ROOT libraries to DYLD_LIBRARY_PATH
ROOT_LIB_DIR="/Users/josiahlee/WORK/Tools/root_install_master/lib"
if [[ -d "$ROOT_LIB_DIR" ]]; then
    if [[ ":$DYLD_LIBRARY_PATH:" != *":$ROOT_LIB_DIR:"* ]]; then
        export DYLD_LIBRARY_PATH="$ROOT_LIB_DIR${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
        echo "✓ Added $ROOT_LIB_DIR to DYLD_LIBRARY_PATH"
    else
        echo "✓ $ROOT_LIB_DIR is already in DYLD_LIBRARY_PATH"
    fi
else
    echo "⚠ ROOT library directory not found: $ROOT_LIB_DIR"
    echo "  Please ensure ROOT is properly installed and update the path in this script"
fi

echo ""
echo "BSG environment setup complete!"
echo ""
echo "Current environment variables:"
echo "  PATH: $BSG_INSTALL_DIR/bin (added)"
echo "  DYLD_LIBRARY_PATH: $BSG_INSTALL_DIR/lib (added)"
echo "  CPATH: $BSG_INSTALL_DIR/include (added)"
echo "  CMAKE_PREFIX_PATH: $BSG_INSTALL_DIR (added)"
echo "  BSG_DATA_DIR: $BSG_DATA_DIR"
echo ""
echo "You can now run BSG executables directly:"
echo "  bsg_exec -i data/init/63Ni.ini -o 63Ni"
echo "  nme_exec"
echo ""
echo "To make these changes permanent, add the following line to your ~/.bashrc or ~/.zshrc:"
echo "  source $(pwd)/setup_bsg_env.sh"
