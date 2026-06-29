resource "aws_route53_record" "catalogue" {
  zone_id = local.zone_id
  name    = "catalogue.backend-alb-${var.env}.${local.domain_name}"
  type    = "A"
  ttl     =  1
  records = [aws_instance.catalogue.private_ip]
}

