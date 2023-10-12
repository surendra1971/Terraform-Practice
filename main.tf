
resource "aws_instance" "web" {
  ami           = var.os
  instance_type = var.ins-size

  tags = {
    Name = var.name
  }
}



resource "aws_s3_bucket" "name" {
  bucket = var.bucket-name
}

resource "aws_iam_user" "example" {
  name               = "${var.username}-user"

}

output "ipaddress" {
  value = aws_instance.web.public_ip
}