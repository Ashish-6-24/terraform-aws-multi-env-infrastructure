variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_public_path" {
  type    = string
  default = "terraform-key.pub"
}

variable "ubuntu_ami_ssm_parameter" {
  type        = string
  description = "SSM parameter containing the Ubuntu AMI ID."
  default     = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}
