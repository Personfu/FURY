# FURY OSINT v1.0.0 - TITAN CONTAINER
# Base: Kali Linux Rolling (Optimized)

FROM kalilinux/kali-rolling:latest

# Environment Configuration
ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-256color
ENV FURY_ROOT=/opt/fury
ENV PATH="/opt/fury/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# 1. Base System Intelligence
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zsh \
    sudo \
    wget \
    build-essential \
    python3 \
    python3-pip \
    golang-go \
    rustc \
    cargo \
    nodejs \
    npm \
    iputils-ping \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

# 2. Workspace Initialization
WORKDIR $FURY_ROOT
RUN mkdir -p $FURY_ROOT/bin $FURY_ROOT/arsenal

# 3. Inject FURY Provisioning Logic
COPY provision/modules/ /opt/fury/provision/modules/
COPY provision/definitions/ /opt/fury/provision/definitions/
COPY src/ /opt/fury/src/

# 4. Atomic Arsenal Synthesis (Headless Mode)
# We run the arsenal provisioner directly within the container build
RUN chmod +x /opt/fury/provision/modules/005_arsenal_provision.sh && \
    /bin/bash /opt/fury/provision/modules/005_arsenal_provision.sh

# 5. Shell Environment Synthesis
RUN chmod +x /opt/fury/provision/modules/006_shell_env.sh && \
    /bin/bash /opt/fury/provision/modules/006_shell_env.sh

# 6. Custom FURY Utilities
RUN chmod +x /opt/fury/provision/modules/007_custom_arsenal.sh && \
    /bin/bash /opt/fury/provision/modules/007_custom_arsenal.sh

# 7. Final Polish
RUN useradd -m -s /bin/zsh fury && \
    echo "fury ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER fury
WORKDIR /home/fury

# Set Zsh theme and aliases for the container user
RUN echo "source /etc/zsh_fury" >> ~/.zshrc

LABEL org.opencontainers.image.source=https://github.com/Personfu/FURY
LABEL org.opencontainers.image.description="FURY OSINT - The Gold Release TITAN Container"
LABEL org.opencontainers.image.licenses=MIT

ENTRYPOINT ["/bin/zsh"]
