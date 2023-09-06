%dw 2.0
output application/json
---
vars.kafkaBatchPayload.value filter not ($.failedDeserialization is Null) map (item) -> {
	topicName: p('kafka.topic'),
	messageKey: item.messageKey replace '"' with '',
	messagePublishedTS: item.messagePublishedTS,
	topicPartition: item.topicPartition,
	topicPartitionOffset: item.topicPartitionOffset,
	errorMessage: item.failedDeserialization
}