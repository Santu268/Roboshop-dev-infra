locals {
public_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
ami_id = data.aws_ami.ami_name.id
common_name = "${var.project}-${var.env}"
frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
common_tags = {
    Project = var.project
    Env = var.env
    Terraform = "true"
    Name = "${local.common_name}-frontend-alb"
}
zone_id = data.aws_route53_zone.primary.zone_id
domain_name = data.aws_route53_zone.primary.name
certificate_arn = data.aws_ssm_parameter.certificate_arn.value

}