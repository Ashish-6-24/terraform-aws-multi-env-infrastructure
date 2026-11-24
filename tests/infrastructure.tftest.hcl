
# Verify infrastructure sizing for dev, stg, and prod workspaces.

mock_provider "aws" {
  mock_data "aws_ssm_parameter" {
    defaults = {
      value = "ami-mock"
    }
  }
}

run "verify_environment_infrastructure" {
  command = plan

  variables {
    key_public_path = "./tests/test_public_key.pub"
  }

  assert {
    condition = (
      terraform.workspace == "dev" &&
      length(module.ec2) == 1 &&
      length(module.s3) == 1 &&
      length(module.dynamodb) == 1
      ) || (
      terraform.workspace == "stg" &&
      length(module.ec2) == 2 &&
      length(module.s3) == 2 &&
      length(module.dynamodb) == 2
      ) || (
      terraform.workspace == "prod" &&
      length(module.ec2) == 4 &&
      length(module.s3) == 3 &&
      length(module.dynamodb) == 2
    )

    error_message = "Infrastructure counts do not match the expected configuration for the selected workspace (dev, stg, or prod)."
  }
}
