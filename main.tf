module "ec2" {
  count = local.environment_config.ec2_count

  source = "./modules/ec2"

  env             = terraform.workspace
  instance_count  = local.current.instance_count
  ami             = data.aws_ssm_parameter.ubuntu_ami.value
  instance_type   = var.instance_type
  key_public_path = var.key_public_path
}

module "s3" {
  count = local.environment_config.s3_count

  source = "./modules/s3"

  env          = terraform.workspace
  bucket_count = 1
}

module "dynamodb" {
  count = local.environment_config.dynamodb_count

  source = "./modules/dynamodb"

  env         = terraform.workspace
  table_count = 1
}
