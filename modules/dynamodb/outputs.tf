output "table_ids" {
  description = "IDs of the created DynamoDB tables."
  value       = aws_dynamodb_table.tables[*].id
}

output "table_arns" {
  description = "ARNs of the created DynamoDB tables."
  value       = aws_dynamodb_table.tables[*].arn
}
