#!/usr/bin/env bash
set -e

sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
sudo dnf install -y spotify-client
