data "aws_ssm_parameter" "certificate_arn" {
    name = "/${var.project}/${var.env}/certificate_arn"
}

data "aws_route53_zone" "primary" {
  name         = var.domain_name
  private_zone = false
} 

data "aws_ssm_parameter" "frontend_alb_sg_id" {
  name = "/${var.project}/${var.env}/frontend_alb_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.env}/public_subnet_ids"
}