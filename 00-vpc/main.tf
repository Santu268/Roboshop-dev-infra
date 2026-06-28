module "vpc" {
   # source = "../terraform-aws-vpc"
    source = "git::https://github.com/Santu268/terraform-aws-vpc.git?ref=main"
    project = var.project
    env = var.env
    is_peering_required = false
}