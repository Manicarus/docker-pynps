FROM python:3.8

ENV PUID=1000 \
    PGID=1000 \
    PATH="$PATH:/home/appuser/.local/bin"

# Create user
RUN groupadd --gid $PGID appuser \
    && useradd --create-home --uid $PUID --gid $PGID appuser
USER $PGID:$PUID

WORKDIR /home/appuser

# Install evertonstz/pynps
RUN pip install --upgrade pip \
    && pip install pynps

# Download the latest lusid1/pkg2zip release
RUN mkdir Downloads \
    && git clone https://github.com/lusid1/pkg2zip.git Downloads/lusid1-pkg2zip

# Compile and install pkg2zip
RUN cd Downloads/lusid1-pkg2zip && make
RUN mkdir -p .config/pyNPS/lib && \
    cp Downloads/lusid1-pkg2zip/pkg2zip .local/bin/

# Cleanup
RUN rm -rf Downloads/lusid1-pkg2zip

VOLUME /home/appuser/.config/pyNPS/
VOLUME /home/appuser/Downloads
