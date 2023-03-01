# Target group
resource "aws_lb_target_group" "target-tg" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${var.vpc_id}"
}

#provision alternative
# Load balancer
resource "aws_elb" "terraform-ram" {
  name = "terraform-elb"
  subnets         = var.subnets
  security_groups = ["${aws_security_group.terraform-sg.id}"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  #ELB attachment
  instances                 = ["${aws_instance.first.id}", "${aws_instance.second.id}", "${aws_instance.third.id}", ]
  cross_zone_load_balancing = true
  idle_timeout              = 40
  tags = {
    Name = "terraform-elb"
  }
}


