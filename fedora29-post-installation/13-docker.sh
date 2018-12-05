#!/usr/bin/env bash

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

#https://github.com/docker/for-linux/issues/430
sudo dnf config-manager --set-enabled docker-ce-test-source docker-ce-test

sudo dnf -y update
sudo dnf -y install docker-ce

systemctl enable docker
systemctl restart docker
sudo groupadd docker
sudo usermod -aG docker $USER
