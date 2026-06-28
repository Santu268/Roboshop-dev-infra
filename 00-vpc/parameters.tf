resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  overwrite = true
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project}/${var.env}/public_subnet_ids"
  type  = "String"
  value = join(",", module.vpc.public_subnet_ids)
  overwrite = true
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project}/${var.env}/private_subnet_ids"
  type  = "String"
  value = join(",", module.vpc.private_subnet_ids)
  overwrite = true
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project}/${var.env}/database_subnet_ids"
  type  = "String"
  value = join(",", module.vpc.database_subnet_ids)
  overwrite = true
}