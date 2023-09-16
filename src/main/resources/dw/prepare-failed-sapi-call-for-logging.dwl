%dw 2.0
output application/json
---
[
	{
		topicName: p('kafka.topic'),
		messageKey: vars.messageAttributes.key replace '"' with '',
		messagePublishedTS: vars.messageAttributes.creationTimestamp,
		topicPartition: vars.messageAttributes.partition,
		topicPartitionOffset: vars.messageAttributes.offset,
		errorMessage: vars.errorMessage
	}
]