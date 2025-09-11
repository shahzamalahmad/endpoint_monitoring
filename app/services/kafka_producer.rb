# app/services/kafka_producer.rb
require "kafka"

class KafkaProducer
  def initialize
    @kafka = Kafka.new([ "localhost:9092" ], client_id: "endpointmonitoring")
  end

  def publish(topic, message)
    producer = @kafka.producer
    producer.produce(message, topic: topic)
    producer.deliver_messages
    producer.shutdown
  end
end
