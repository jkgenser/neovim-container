#!/bin/bash

cp -r ~/.config/nvim .

podman build -t neovim-dev .
