provider "aws" {
  region = "eu-north-1"

  default_tags {
    tags = {
      Project   = "aws-ecs-rds-terraform"
      Owner     = "YanSharp-Terraform"
      Env       = "dev"
    }
  }

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {}
}

resource "aws_iam_role" "example_role" {
  name = "examplerole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}