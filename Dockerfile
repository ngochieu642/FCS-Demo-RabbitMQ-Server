# LOAD BASE IMAGES
FROM rabbitmq:3.7.17-management

ARG BUILD_ENV
ENV BUILD_ENV $BUILD_ENV

ADD import_definitions/rabbitmq.config /etc/rabbitmq/
ADD import_definitions/definitions.json /etc/rabbitmq/
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config /etc/rabbitmq/definitions.json
RUN rabbitmq-plugins enable rabbitmq_management && \
    rabbitmq-plugins enable rabbitmq_mqtt && \
    rabbitmq-plugins enable rabbitmq_web_mqtt && \
    rabbitmq-plugins enable rabbitmq_amqp1_0
CMD ["rabbitmq-server"]