resource "aws_lb" "lb_frontend" {
  name               = "lb-frontend"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = [var.subnet1_id, var.subnet2_id]

  enable_deletion_protection = false
  tags = {
    Name = "lb-frontend"
  }
}

resource "aws_lb_target_group" "tg_frontend" {
  name     = "tg-frontend"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  target_type = "instance"

  tags = {
    Name = "tg-frontend"
  }
}

resource "aws_lb_listener" "listener_frontend" {
  load_balancer_arn = aws_lb.lb_frontend.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_frontend.arn
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment1" {
  target_group_arn = aws_lb_target_group.tg_frontend.arn
  target_id        = var.frontend_instance1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attachment2" {
  target_group_arn = aws_lb_target_group.tg_frontend.arn
  target_id        = var.frontend_instance2_id
  port             = 80
}
