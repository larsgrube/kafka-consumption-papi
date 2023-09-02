%dw 2.0
output application/java

var payloadValues = vars.payloadValues map value: $.payload

var payloadAttributes = payload.*attributes map (item) -> {
	attributes: {
		key: item.key as String,
		creationTimestamp: item.creationTimestamp as String,
		partition: item.partition,
		offset: item.offset
	}
}
---
(payloadValues zip payloadAttributes) map (item) -> {
	attributes: {(item.attributes)},
	value: {(item.value)} ++ 
			{
				messageKey: item.attributes.key[0],
				messagePublishedTS: item.attributes.creationTimestamp[0],
				topicPartition: item.attributes.partition[0],
				topicPartitionOffset: item.attributes.offset[0]
			}
} 
