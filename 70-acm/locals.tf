locals {
common_name = "${var.project}-${var.env}"
common_tags = {
    Project = var.project
    Env = var.env
    Terraform = "true"
    Name = "${local.common_name}-catalogue"
}
zone_id = data.aws_route53_zone.primary.zone_id
domain_name = data.aws_route53_zone.primary.name
}