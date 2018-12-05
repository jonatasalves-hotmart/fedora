#!/usr/bin/env bash
set -e

sudo dnf install -y xorg-x11-drv-nvidia akmod-nvidia
sudo dnf update -y
reboot
