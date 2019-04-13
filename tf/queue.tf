resource "google_pubsub_topic" "messages" {
  name = "tts-messages"
}

resource "google_pubsub_subscription" "messages-subscription" {
  name  = "messages-subscription"
  topic = "${google_pubsub_topic.messages.name}"
  ack_deadline_seconds = 60
}

resource "google_service_account" "server-account" {
  account_id   = "server-account"
  display_name = "server account"
}