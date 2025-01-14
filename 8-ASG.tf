resource "aws_autoscaling_group" "tokyo-asg" {
  provider = aws.tokyo
  name_prefix           = "tokyo-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.tokyo_subnet_private_1a.id,
    aws_subnet.tokyo_subnet_private_1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.tokyo-tg.arn]


  launch_template {
    id      = aws_launch_template.tokyo_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "tokyo-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


### Auto Scaling Policy
resource "aws_autoscaling_policy" "tokyo-scaling-policy" {
  provider = aws.tokyo
  name                   = "tokyo-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.tokyo-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling Instance Scale-In Protection
resource "aws_autoscaling_attachment" "tokyo-asg-attachment" {
  provider = aws.tokyo
  autoscaling_group_name = aws_autoscaling_group.tokyo-asg.name
  lb_target_group_arn   = aws_lb_target_group.tokyo-tg.arn
}


######################## VIRGINIA ASG ###############################################


resource "aws_autoscaling_group" "virginia-asg" {
  provider = aws.virginia
  name_prefix           = "virginia-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.virginia_subnet_private_1a.id,
    aws_subnet.virginia_subnet_private_1b.id,
   
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.virginia-tg.arn]


  launch_template {
    id      = aws_launch_template.virginia_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "virginia-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}




### Auto Scaling Policy
resource "aws_autoscaling_policy" "virginia-scaling-policy" {
  provider = aws.virginia
    
  name                   = "virginia-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.virginia-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling Instance Scale-In Protection
resource "aws_autoscaling_attachment" "virginia-asg-attachment" {
  provider = aws.virginia
  autoscaling_group_name = aws_autoscaling_group.virginia-asg.name
  lb_target_group_arn   = aws_lb_target_group.virginia-tg.arn
}


######################## HONG KONG ASG #######################################


resource "aws_autoscaling_group" "hong_kong-asg" {
  provider = aws.hong-kong
  name_prefix           = "hongkong-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.hong_kong_subnet_private_1a.id,
    aws_subnet.hong_kong_subnet_private_1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.hong_kong-tg.arn]


  launch_template {
    id      = aws_launch_template.hong_kong_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "hongkong-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


### Auto Scaling Policy
resource "aws_autoscaling_policy" "hong_kong-scaling-policy" {
  provider = aws.hong-kong
  name                   = "hongkong-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.hong_kong-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling Instance Scale-In Protection
resource "aws_autoscaling_attachment" "hong_kong-asg-attachment" {
  provider = aws.hong-kong
  autoscaling_group_name = aws_autoscaling_group.hong_kong-asg.name
  lb_target_group_arn   = aws_lb_target_group.hong_kong-tg.arn
}


########################## AUSTRALIA ASG ####################################


resource "aws_autoscaling_group" "australia-asg" {
  provider = aws.australia
  name_prefix           = "australia-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.australia_subnet_private_1a.id,
    aws_subnet.australia_subnet_private_1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.australia-tg.arn]


  launch_template {
    id      = aws_launch_template.australia_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "australia-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


### Auto Scaling Policy
resource "aws_autoscaling_policy" "australia-scaling-policy" {
  provider = aws.australia
  name                   = "australia-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.australia-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "australia-asg-attachment" {
  provider = aws.australia
  autoscaling_group_name = aws_autoscaling_group.australia-asg.name
  lb_target_group_arn   = aws_lb_target_group.australia-tg.arn
}


######################### CALIFORNIA ASG #############################




resource "aws_autoscaling_group" "california-asg" {
  provider = aws.california
  name_prefix           = "california-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.california_subnet_private_1a.id,
    aws_subnet.california_subnet_private_1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.california-tg.arn]


  launch_template {
    id      = aws_launch_template.california_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "california-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


### Auto Scaling Policy
resource "aws_autoscaling_policy" "california-scaling-policy" {
  provider = aws.california
  name                   = "california-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.california-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling instance scale-in protection
resource "aws_autoscaling_attachment" "california-asg-attachment" {
  provider = aws.california
  autoscaling_group_name = aws_autoscaling_group.california-asg.name
  lb_target_group_arn   = aws_lb_target_group.california-tg.arn
}


#################### LONDON ASG #######################################


resource "aws_autoscaling_group" "london-asg" {
  provider = aws.london
  name_prefix           = "london-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.london_subnet_private_1a.id,
    aws_subnet.london_subnet_private_1b.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.london-tg.arn]


  launch_template {
    id      = aws_launch_template.london_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "london-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


### Auto Scaling Policy
resource "aws_autoscaling_policy" "london-scaling-policy" {
  provider = aws.london
  name                   = "london-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.london-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling Instance Scale-In Protection
resource "aws_autoscaling_attachment" "london-asg-attachment" {
  provider = aws.london
  autoscaling_group_name = aws_autoscaling_group.london-asg.name
  lb_target_group_arn   = aws_lb_target_group.london-tg.arn
}


##################### SAO PAULO ASG #####################################


resource "aws_autoscaling_group" "sao_paulo-asg" {
  provider = aws.sao-paulo
  name_prefix           = "saopaulo-auto-scaling-group"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 3
  vpc_zone_identifier   = [
    aws_subnet.sao_paulo_subnet_private_1a.id,
    aws_subnet.sao_paulo_subnet_private_1c.id
  ]
  health_check_type          = "ELB"
  health_check_grace_period  = 300
  force_delete               = true
  target_group_arns          = [aws_lb_target_group.sao-paulo-tg.arn]


  launch_template {
    id      = aws_launch_template.sao_paulo_lt.id
    version = "$Latest"
  }


  enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupTotalInstances"]


  # Instance protection for launching
  initial_lifecycle_hook {
    name                  = "instance-protection-launch"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 60
    notification_metadata = "{\"key\":\"value\"}"
  }


  # Instance protection for terminating
  initial_lifecycle_hook {
    name                  = "scale-in-protection"
    lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
    default_result        = "CONTINUE"
    heartbeat_timeout     = 300
  }


  tag {
    key                 = "Name"
    value               = "saopaulo-instance"
    propagate_at_launch = true
  }


  tag {
    key                 = "Environment"
    value               = "Production"
    propagate_at_launch = true
  }
}


### Auto Scaling Policy
resource "aws_autoscaling_policy" "saopaulo-scaling-policy" {
  provider = aws.sao-paulo  
  name                   = "saopaulo-cpu-target"
  autoscaling_group_name = aws_autoscaling_group.sao_paulo-asg.name


  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 120


  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}


### Enabling Instance Scale-In Protection
resource "aws_autoscaling_attachment" "saopaulo-asg-attachment" {
  provider = aws.sao-paulo
  autoscaling_group_name = aws_autoscaling_group.sao_paulo-asg.name
  lb_target_group_arn   = aws_lb_target_group.sao-paulo-tg.arn
}


