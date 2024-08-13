FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    neovim \
    git \
    curl \
    build-essential \
    sudo \
    python3-venv \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*


# note: if we are root in the rootless container
# that actually maps to 1000:1000 on the host



CMD ["/bin/bash"]
