FROM rabbitmq:3-management

COPY ./rabbitmq.plugins/ /opt/rabbitmq/plugins

RUN ls -lah /opt/rabbitmq/plugins
RUN rabbitmq-plugins enable --offline \
  rabbitmq_mqtt \
  rabbitmq_federation_management \
  rabbitmq_stomp \
  rabbitmq_delayed_message_exchange

