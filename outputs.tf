
output "environment" {
  description = "Current Terraform workspace"
  value       = terraform.workspace
}

output "ec2_instance_count" {
  description = "Number of EC2 instances configured"
  value       = local.environment_config.ec2_count
}

output "s3_bucket_count" {
  description = "Number of application S3 buckets configured"
  value       = local.environment_config.s3_count
}

output "dynamodb_table_count" {
  description = "Number of DynamoDB tables configured"
  value       = local.environment_config.dynamodb_count
}
