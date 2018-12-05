#!/usr/bin/env bash
sudo dnf groupupdate -y multimedia sound-and-video
sudo dnf install -y compat-ffmpeg28
