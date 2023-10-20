FROM bitnami/kafka:3.4.1
USER root
RUN install_packages gettext

ADD ./connect-distributed.template /opt/mirrormaker/connect-distributed.template
ADD ./run.sh /opt/mirrormaker/run.sh
RUN chmod +x /opt/mirrormaker/run.sh

RUN mkdir -p /var/run/mirrormaker
RUN chown 1234 /var/run/mirrormaker

ENV DESTINATION_BOOTSTRAP_SERVER "source-cluster:9092"
ENV REPLICATION_FACTOR 3
ENV OFFSET_STORAGE_TOPIC "connect-offsets"
ENV CONFIG_STORAGE_TOPIC "connect-config"
ENV STATUS_STORAGE_TOPIC "connect-status"
ENV TASKS_MAX 10

USER 1234
CMD /opt/mirrormaker/run.sh
