locals {
  environment_config = lookup({
    dev = {
      ec2_count      = 1
      s3_count       = 1
      dynamodb_count = 1
      instance_count = 1
    }
    stg = {
      ec2_count      = 2
      s3_count       = 2
      dynamodb_count = 2
      instance_count = 1
    }
    prod = {
      ec2_count      = 4
      s3_count       = 3
      dynamodb_count = 2
      instance_count = 1
    }
    }, terraform.workspace, {
    ec2_count      = 0
    s3_count       = 0
    dynamodb_count = 0
    instance_count = 1
  })

  current = local.environment_config
}
