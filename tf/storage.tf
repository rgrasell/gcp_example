resource "google_storage_bucket" "example-store" {
  name     = "example-store-bucket"
  location = "US"
  storage_class = "MULTI_REGIONAL"
}