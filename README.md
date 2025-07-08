# ECS with EC2 Launch Type - Terraform Configuration

This Terraform configuration creates a complete ECS environment with EC2 launch type, including VPC, networking, security groups, IAM roles, ECS cluster, auto scaling group, and application load balancer.

## 🏗️ Architecture

- **VPC** with public and private subnets
- **ECS Cluster** with EC2 launch type
- **Auto Scaling Group** for EC2 instances
- **Application Load Balancer** for traffic distribution
- **Security Groups** with proper access controls
- **CloudWatch Logs** for container logging

## 📁 File Structure

```
├── main.tf              # Provider configuration
├── variables.tf         # Input variables
├── locals.tf           # Common values and tags
├── data.tf             # Data sources
├── vpc.tf              # VPC and networking
├── sg.tf               # Security groups
├── iamrole.tf          # IAM roles and policies
├── ecs.tf              # ECS cluster and service
├── autoscaling.tf      # Launch template and ASG
├── task.tf             # Task definition
├── alb.tf              # Load balancer
├── cloud.tf            # CloudWatch resources
├── outputs.tf          # Output values
└── terraform.tfvars.example # Example configuration
```

## 🚀 Quick Start

1. **Clone and navigate to the directory**:
   ```bash
   cd circleci-node-app
   ```

2. **Copy the example configuration**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

3. **Review and modify terraform.tfvars** as needed

4. **Initialize Terraform**:
   ```bash
   terraform init
   ```

5. **Plan the deployment**:
   ```bash
   terraform plan
   ```

6. **Apply the configuration**:
   ```bash
   terraform apply
   ```

## 🔧 Configuration

### Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `aws_region` | AWS region | `us-east-1` |
| `environment` | Environment name | `dev` |
| `instance_type` | EC2 instance type | `t3.medium` |
| `desired_capacity` | ASG desired capacity | `2` |
| `app_image` | Docker image | `nginx:latest` |

### Customization

1. **Change the application image**:
   ```hcl
   app_image = "your-registry/your-app:latest"
   ```

2. **Modify instance type**:
   ```hcl
   instance_type = "t3.large"
   ```

3. **Adjust scaling**:
   ```hcl
   desired_capacity = 3
   max_size        = 6
   ```

## 🔒 Security Features

- **Private subnets** for ECS tasks
- **Public subnets** only for ALB
- **Security groups** with minimal required access
- **IAM roles** with least privilege
- **Container insights** enabled

## 📊 Monitoring

- **CloudWatch Logs** for container logs
- **ALB health checks** for application health
- **ECS service metrics** available in CloudWatch

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy
```

## 📝 Best Practices Followed

- ✅ **Code Organization**: Logical file separation
- ✅ **Security**: Proper IAM roles and security groups
- ✅ **Networking**: VPC with public/private subnets
- ✅ **Variables**: Centralized configuration
- ✅ **Tagging**: Consistent resource tagging
- ✅ **Documentation**: Comprehensive README
- ✅ **Versioning**: Provider version constraints

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `terraform plan`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.