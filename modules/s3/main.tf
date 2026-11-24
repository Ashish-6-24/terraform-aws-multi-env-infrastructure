resource "aws_s3_bucket" "buckets" {
  count = var.bucket_count

  bucket = "${var.env}-terraform-app-bucket-${count.index + 1}"

  tags = {
    Name        = "${var.env}-terraform-app-bucket-${count.index + 1}"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "buckets" {
  count = var.bucket_count

  bucket = aws_s3_bucket.buckets[count.index].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "buckets" {
  count = var.bucket_count

  bucket = aws_s3_bucket.buckets[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
