# Outputs
output "cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "asg_name" {
  value = aws_autoscaling_group.ecs.name
}
