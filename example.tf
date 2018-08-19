provider "aws" {
  region     = "us-east-1"
  version = "~> 1.32"
}

resource "aws_instance" "example" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"
}
