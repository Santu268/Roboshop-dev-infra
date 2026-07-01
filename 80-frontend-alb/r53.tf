resource "aws_route53_record" "www" {
  zone_id = local.zone_id
  name    = "${local.common_name}}.${local.domain_name}" # *.backend-alb-dev.santoshshell.online
  type    = "A"

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}