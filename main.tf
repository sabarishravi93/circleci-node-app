
provider "aws" {
  region = "us-east-1"  # Change region as needed
}

resource "aws_instance" "example" {
  ami           = "ami-05ffe3c48a9991133"  # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "circleci-ec2"
  }
}