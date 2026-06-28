module "sg" {
   # source = "../terraform-aws-vpc"
    source = "git::https://github.com/Santu268/terraform-aws-sg.git?ref=main"
    project = var.project
    env = var.env
    vpc_id = local.vpc_id
}