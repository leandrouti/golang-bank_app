FROM golang:1.24

# Build arguments for non-root user
ARG UID=1000
ARG GID=1000
ARG USERNAME=devuser

# Create non-root user and group
RUN groupadd -g ${GID} ${USERNAME} && \
    useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME}

# Set Go environment variables
ENV GO111MODULE=on \
    CGO_ENABLED=0

# Install Air (live reload) and migrate CLI
RUN go install github.com/air-verse/air@latest && \
    curl -L https://github.com/golang-migrate/migrate/releases/download/v4.17.1/migrate.linux-amd64.tar.gz -o migrate.tar.gz && \
    tar -xzf migrate.tar.gz && \
    mv migrate /usr/local/bin/migrate && \
    chmod +x /usr/local/bin/migrate && \
    rm migrate.tar.gz

# Set working directory
WORKDIR /app

# Change to non-root user
USER ${USERNAME}

# Default command
CMD ["air"]
