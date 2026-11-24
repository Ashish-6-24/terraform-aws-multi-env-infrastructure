
variable "env" {
  description = "Environment name, such as dev, stg, or prod."
  type        = string
}

variable "key_public_path" {
  description = "Path to the SSH public key file."
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 1

  validation {
    condition = (
      var.instance_count >= 1 &&
      var.instance_count == floor(var.instance_count)
    )

    error_message = "Instance count must be a positive whole number."
  }
}

variable "ami" {
  description = "AMI ID used to launch EC2 instances."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type, such as t3.micro."
  type        = string
  default     = "t3.micro"
}
