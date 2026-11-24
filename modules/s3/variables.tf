variable "env" {
  description = "Environment name, such as dev, stg, or prod."
  type        = string
}

variable "bucket_count" {
  description = "Number of S3 buckets to create."
  type        = number
  default     = 1

  validation {
    condition = (
      var.bucket_count >= 1 &&
      var.bucket_count == floor(var.bucket_count)
    )

    error_message = "Bucket count must be a positive whole number."
  }
}
