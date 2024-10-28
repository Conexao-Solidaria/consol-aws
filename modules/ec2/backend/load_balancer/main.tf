resource "aws_lb" "lb_backend" {
  name               = "lb-backend"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = [var.subnet_id]

  enable_deletion_protection = false
  tags = {
    Name = "lb_backend"
  }
}

resource "aws_lb_target_group" "tg_backend" {
  name     = "tg-backend"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "tg_backend"
  }
}

resource "aws_lb_listener" "listener_backend" {
  load_balancer_arn = aws_lb.lb_backend.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_backend.arn
  }
}
