provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "devops-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "pet-vpc"
    vpc_env: "uat"
  }
}

resource "aws_subnet" "devops-subnet-1" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "myvpc-public-01"
  }
}

resource "aws_subnet" "devops-subnet-2" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "myvpc-public-02"
  }
}

resource "aws_subnet" "devops-subnet-3" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "myvpc-private-01"
  }
}

resource "aws_subnet" "devops-subnet-4" {
  vpc_id     = aws_vpc.devops-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "myvpc-private-02"
  }
}

output "devops-vpc-id" {
  value = aws_vpc.devops-vpc.id
}

output "devops-subnet-id" {
  value = aws_subnet.devops-subnet-1.id
}