locals {
database_subnet_id = split(",",data.aws_ssm_parameter.database_subnet_id.value)[0]
ami_id = data.aws_ami.ami_name.id
common_name = "${var.project}-${var.env}"
mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
common_tags = {
    Project = var.project
    Env = var.env
    Terraform = "true"
    Name = "${local.common_name}-mongodb"
}
zone_id = data.aws_route53_zone.primary.zone_id
domain_name = data.aws_route53_zone.primary.name

}