resource "aws_lb" "app1_alb" {
  provider = aws.tokyo
  name               = "app1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tokyo_sg.id]
  subnets            = [
    aws_subnet.tokyo_subnet_public_1a.id,
    aws_subnet.tokyo_subnet_private_1c.id,
    

  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "App1LoadBalancer"
    Service = "Multiapp"
    Owner   = "Ninjas SWKS"
    Project = "Multiapp"
  }
}

resource "aws_lb" "app1_alb2" {
  provider = aws.osaka
  name               = "app1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.osaka_sg.id]
  subnets            = [
    # aws_subnet.tokyo_subnet_public_1a.id,
    aws_subnet.osaka_subnet_public_3a.id,
    aws_subnet.osaka_subnet_private_3c.id,
   

  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "App1LoadBalancer"
    Service = "Multiapp"
    Owner   = "Ninjas SWKS"
    Project = "Multiapp"
  }
}
resource "aws_lb_listener" "http" {
  provider          = aws.tokyo
  load_balancer_arn = aws_lb.app1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tokyo-tg.arn
  }
}