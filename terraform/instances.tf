# Instances Configuration for Terraform

resource "aws_instance" "kali_linux" {
  ami           = "ami-0abcdef1234567890" # Replace with the correct AMI ID for Kali Linux
  instance_type = "t2.micro"
}

resource "aws_instance" "ubuntu_22_04" {
  ami           = "ami-0abcdef1234567890" # Replace with the correct AMI ID for Ubuntu 22.04
  instance_type = "t2.micro"
}

resource "aws_instance" "windows_server_2022" {
  ami           = "ami-0abcdef1234567890" # Replace with the correct AMI ID for Windows Server 2022
  instance_type = "t2.micro"
}