#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "Falta argumento"
    exit 1
fi

sudo hostname $1
hostnamectl set-hostname $1
