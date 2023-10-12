
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

resource "aws_iam_role" "example" {
  name               = "${(var.username)-user}"
  assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json # (not shown)

  
}