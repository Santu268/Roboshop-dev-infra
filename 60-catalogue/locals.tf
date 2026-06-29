locals {
private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_id.value)[0]
ami_id = data.aws_ami.ami_name.id
common_name = "${var.project}-${var.env}"
catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
common_tags = {
    Project = var.project
    Env = var.env
    Terraform = "true"
    Name = "${local.common_name}-catalogue"
}
zone_id = data.aws_route53_zone.primary.zone_id
domain_name = data.aws_route53_zone.primary.name

}