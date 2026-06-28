locals {
partition_num = 4
size = 30
public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_id.value)[0]
ami_id = data.aws_ami.ami_name.id
common_name = "${var.project}-${var.env}"
bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
common_tags = {
    Project = var.project
    Env = var.env
    Terraform = "true"
    Name = "${local.common_name}-${var.component}"
}

}