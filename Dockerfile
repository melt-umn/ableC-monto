FROM rust:latest

RUN apt-get update && apt-get install -y ant default-jdk-headless git make tmux

RUN mkdir -p /data
WORKDIR /data

RUN git clone https://github.com/melt-umn/monto-rs.git
RUN git clone https://github.com/melt-umn/ableC.git
RUN git clone https://github.com/melt-umn/silver.git

WORKDIR /data/silver
RUN git checkout feature/better-errors

WORKDIR /data/silver/support/bin
RUN mkdir -p /root/bin
ENV PATH=$PATH:/root/bin/
RUN bash install-silver-bin

WORKDIR /data/silver
RUN bash update
RUN bash deep-rebuild

RUN mkdir -p /data/extensions
WORKDIR /data/extensions

RUN git clone https://github.com/melt-umn/ableC-algebraic-data-types.git
RUN git clone https://github.com/melt-umn/ableC-cilk.git
RUN git clone https://github.com/melt-umn/ableC-regex-lib.git
RUN git clone https://github.com/melt-umn/ableC-regex-pattern-matching.git

ADD . /data/ableC-monto
WORKDIR /data/ableC-monto/demo
ENV MONTO_RS_DIR=/data/monto-rs
ENV SILVER_HOME=/data/silver
RUN make
CMD make run
