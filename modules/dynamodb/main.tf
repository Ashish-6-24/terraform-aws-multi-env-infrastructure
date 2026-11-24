resource "aws_dynamodb_table" "tables" {
  count = var.table_count

  name         = "${var.env}-terraform-table-${count.index + 1}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name        = "${var.env}-terraform-table-${count.index + 1}"
    Environment = var.env
  }
}
