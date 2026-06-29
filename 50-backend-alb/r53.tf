resource "aws_route53_record" "backend_alb" {
  zone_id = local.zone_id
  name    = "*.backend-alb-${var.env}.${local.domain_name}" # *.backend-alb-dev.santoshshell.online
  type    = "A"

  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}