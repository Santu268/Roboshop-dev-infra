locals {
private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
ami_id = data.aws_ami.ami_name.id
common_name = "${var.project}-${var.env}"
backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
common_tags = {
    Project = var.project
    Env = var.env
    Terraform = "true"
    Name = "${local.common_name}-backend_alb"
}
zone_id = data.aws_route53_zone.primary.zone_id
domain_name = data.aws_route53_zone.primary.name

}