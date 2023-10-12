
resource "aws_instance" "web" {
  ami           = var.os
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

variable "os" {
  type = string
  default = "ami-0c1d144c8fdd8d690"
  description = "This is my AMI-ID"
}