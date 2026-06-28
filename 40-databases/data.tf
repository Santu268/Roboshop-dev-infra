data "aws_ami" "ami_name" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project}/${var.env}/redis_sg_id"
}

data "aws_ssm_parameter" "rabbitmq_sg_id" {
  name = "/${var.project}/${var.env}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project}/${var.env}/mysql_sg_id"
}


data "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.project}/${var.env}/database_subnet_ids"
  }

 data "aws_route53_zone" "primary" {
  name         = var.domain_name
  private_zone = false
} 