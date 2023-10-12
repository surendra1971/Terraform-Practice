
resource "aws_instance" "web" {
  ami           = var.os
  instance_type = var.ins-size

  tags = {
    Name = var.name
  }
}

variable "os" {
  type = string
  default = "ami-0c1d144c8fdd8d690"
  description = "This is my AMI-ID"
}

variable "ins-size" {
  default = "t2.micro"
}
variable "name" {
  default = "HelloWorld"
  
}