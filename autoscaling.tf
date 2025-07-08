
# Auto Scaling Group
resource "aws_launch_template" "ecs" {
  name_prefix   = "${local.name_prefix}-lt"
  image_id      = data.aws_ami.ecs_optimized.id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.ecs.id]
  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_instance_profile.name
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "ECS_CLUSTER=${aws_ecs_cluster.main.name}" >> /etc/ecs/ecs.config
              echo "ECS_ENABLE_TASK_ENI=true" >> /etc/ecs/ecs.config
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.common_tags, {
      Name = "${local.name_prefix}-instance"
    })
  }
}

resource "aws_autoscaling_group" "ecs" {
  name                = "${local.name_prefix}-asg"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  target_group_arns   = [aws_lb_target_group.app.arn]
  vpc_zone_identifier = [aws_subnet.private.id]

  launch_template {
    id      = aws_launch_template.ecs.id
    version = "$Latest"
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${local.name_prefix}-asg"
    propagate_at_launch = true
  }
}