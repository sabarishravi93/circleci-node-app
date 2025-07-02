terraform {
  backend "s3" {
    bucket         = "circleci-node-terraform-state-1"   # Replace with your S3 bucket name
    key            = "terraform/terraform.tfstate"      # Path within the bucket
    region         = "us-east-1"                        # Same region where EC2 is launched
    dynamodb_table = "circleci-node-terraform-locks-1"    # Replace with your DynamoDB table (for locking)
    encrypt        = true
  }
}
