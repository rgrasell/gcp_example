variable "gcp_project" {
	type = "string"
	# default = ""
}

variable "gcp_region" {
	type = "string"
	default = "us-central1"
}

variable "private_key_path" {
	type = "string"
	default = "certs/privkey.pem"
}

variable "cert_path" {
	type = "string"
	default = "certs/cert.pem"
}

variable "fullchain_path" {
	type = "string"
	default = "certs/fullchain.pem"
}