# Common tags for all resources
locals {
  common_tags = {
    Environment = var.environment
    Project     = "ecs-app"
    ManagedBy   = "terraform"
    Owner       = "devops-team"
  }

  name_prefix = "ecs-${var.environment}"
} 