########## TOKYO TARGET GROUP ##########
resource "aws_lb_target_group" "tokyo-tg" {
  provider = aws.tokyo
  name     = "tokyo-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tokyo_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "tokyo-target-group"
    }
}


########## VIRGINIA TARGET GROUP ########
resource "aws_lb_target_group" "virginia-tg" {
  provider = aws.virginia 
  name     = "virginia-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.virginia_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "virginia-target-group"
    }
}


######## HONG KONG TARGET GROUP #######
resource "aws_lb_target_group" "hong_kong-tg" {
  provider = aws.hong-kong
  name     = "hong-kong-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hong-kong_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "hong_kong-target-group"
    }
}


######## AUSTRALIA TARGET GROUP #######
resource "aws_lb_target_group" "australia-tg" {
  provider = aws.australia
  name     = "australia-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.australia_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "australia-target-group"
    }
}


######## CALIFORNIA TARGET GROUP #######
resource "aws_lb_target_group" "california-tg" {
  provider = aws.california
  name     = "california-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.california_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "california-target-group"
    }
}


######## LONDON TARGET GROUP #######
resource "aws_lb_target_group" "london-tg" {
  provider = aws.london
  name     = "london-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.london_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "london-target-group"
    }
}


######## SAO PAULO TARGET GROUP #######
resource "aws_lb_target_group" "sao-paulo-tg" {
  provider = aws.sao-paulo
  name     = "saopaulo-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.sao-paulo_vpc.id
  target_type = "instance"


  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }


  tags = {
    Name    = "saopaulo-target-group"
    }
}
