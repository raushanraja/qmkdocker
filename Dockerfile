FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
ENV QMK_DIR=/qmk

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    gcc-avr \
    avr-libc \
    binutils-avr \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    libnewlib-arm-none-eabi \
    avrdude \
    dfu-util \
    dfu-programmer \
    teensy-loader-cli \
    libusb-dev \
    libusb-1.0-0-dev \
    git \
    wget \
    curl \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies for QMK
RUN pip3 install --no-cache-dir \
    qmk \
    flake8 \
    pyyaml \
    jsonschema \
    nose2 \
    appdirs \
    argcomplete \
    hidapi \
    milc \
    nrfutil \
    pyserial

# Set up QMK environment

RUN qmk config user.qmk_home="$QMK_DIR" 
RUN git config --global --add safe.directory /qmk 
RUN qmk setup --yes
