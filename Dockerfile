FROM ubuntu:17.04
COPY setup.sh /tmp/setup.sh
RUN /tmp/setup.sh
COPY run.sh /creepMiner/run.sh
ENV SET_TIMEZONE false
ENV TIMEZONE Etc/UTC
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
