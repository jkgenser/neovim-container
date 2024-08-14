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

# TODO: parameterize the user
COPY ./nvim /root/.config/nvim

# install stuff using Lazy
RUN nvim --headless "+Lazy! sync" +qa

# RUN nvim --headless -c 'autocmd User LazyDone quitall' -c 'lua require("lazy").load()' || echo "Lazy.nvim did not complete successfully"
# RUN nvim --headless -c 'autocmd User LazyDone quitall'

CMD ["/bin/bash"]
