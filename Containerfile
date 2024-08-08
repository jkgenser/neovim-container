FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    neovim \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set up a non-root user
RUN useradd -m developer
USER developer
WORKDIR /home/developer

# Set up Neovim configuration directory
RUN mkdir -p /home/developer/.config/nvim

# Set the entrypoint to bash
CMD ["/bin/bash"]
