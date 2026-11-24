terraform {
  backend "s3" {
    bucket               = "terraform-state-buck-9a4f7c2e"
    key                  = "terraform.tfstate"
    region               = "ap-southeast-2"
    encrypt              = true
    use_lockfile         = true
    workspace_key_prefix = "env"
  }
}
