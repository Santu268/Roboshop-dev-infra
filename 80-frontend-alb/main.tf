resource "aws_lb" "frontend_alb" {
  name               = "${local.common_name}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.public_subnet_id

  enable_deletion_protection = false

   tags = local.common_tags
  )
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<html><head><h1>Test ALB</h1></head><body>Hi, I am from HTTPS Frontend ALB</body></html>"
      status_code  = "200"
    }
  }
}

