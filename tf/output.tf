output "subscription" {
  value = "projects/${google_pubsub_topic.messages.project}/subscriptions/${google_pubsub_subscription.messages-subscription.name}"
}

output "topic" {
  value = "projects/${google_pubsub_topic.messages.project}/topics/${google_pubsub_topic.messages.name}"
}