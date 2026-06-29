resource "aws_lb" "backend_alb" {
  name               = "${var.project}-${var.env}-backend_alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_id

  enable_deletion_protection = false

  access_logs {
    bucket  = terraform-state-daws90-v1
    prefix  = "backend-lb"
    enabled = true
  }

  tags = merge (
    local.common_tags,
    {
      Name = "${local.common_name}-backend_alb"
    }
  )
}

resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<html><head><h1>app load balancer</head><body>welcome to Load balancer concept</body></html>"
      status_code  = "200"
    }
  }
}

