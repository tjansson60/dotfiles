#!/usr/bin/env sh

# Current kernel
echo "Running kernel"
uname -sr
echo " "

# Installed kernel
echo "List of installed kernels"
ls -l /boot/initrd.img*
echo " "

# Remove a kernel
echo "Removing a specific kernel" 
echo "Example: sudo apt remove linux-image-5.14.0-2-amd64"
echo "Afterwards the following is a good idea: sudo apt autoremove"
