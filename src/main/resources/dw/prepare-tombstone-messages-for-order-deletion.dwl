%dw 2.0
output application/json
---
vars.kafkaBatchPayload.value filter ($.tombstoneMessage default false) map (item) -> {
	orderId: item.messageKey replace '"' with '',
	orderCanceledTS: item.messagePublishedTS
}