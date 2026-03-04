resource "aws_vpc" "lab_ciber" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "lab-ciber"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.lab_ciber.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "lab-ciber-subnet-a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.lab_ciber.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "lab-ciber-subnet-b"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.lab_ciber.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "lab-ciber-subnet-c"
  }
}