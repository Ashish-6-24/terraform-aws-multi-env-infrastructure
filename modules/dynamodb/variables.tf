variable "env" {
  description = "Environment name, such as dev, stg, or prod."
  type        = string
}

variable "table_count" {
  description = "Number of DynamoDB tables to create."
  type        = number
  default     = 1

  validation {
    condition = (
      var.table_count >= 1 &&
      var.table_count == floor(var.table_count)
    )

    error_message = "Table count must be a positive whole number."
  }
}
