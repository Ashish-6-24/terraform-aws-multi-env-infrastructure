output "bucket_ids" {
  description = "IDs of the created S3 buckets."
  value       = aws_s3_bucket.buckets[*].id
}

output "bucket_arns" {
  description = "ARNs of the created S3 buckets."
  value       = aws_s3_bucket.buckets[*].arn
}
