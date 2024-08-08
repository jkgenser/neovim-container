FROM ubuntu:latest

ARG UID=1000
ARG GID=1000

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    neovim \
    git \
    curl \
    build-essential \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Set up a non-root user
RUN useradd -m -s /bin/bash developer \
    && echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Adjust UID and GID
RUN usermod -u $UID developer \
    && groupmod -g $GID developer \
    && chown -R developer:developer /home/developer

USER developer
WORKDIR /home/developer

# Set up Neovim configuration directory
RUN mkdir -p /home/developer/.config/nvim

CMD ["/bin/bash"]
