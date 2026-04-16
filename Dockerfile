FROM texlive/texlive:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends make && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /resume

COPY . .

# Symlink so relative 'output/' in CMD resolves to the /output mount point
RUN ln -s /output output

CMD make compile && cp resume.pdf output/
