#!/bin/bash

podman run --rm --name neovim-container --replace -it \
  -v $HOME/.config/:/root/.config/:Z \
  -v $(pwd):/workspace:Z \
  -w /workspace \
  neovim-dev /bin/bash -c "$@"

