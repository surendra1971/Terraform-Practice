provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "example" {
    ami                        = ami-0007644809ee80683
    instance_type              = t2.micro
    security_group_ids         = sg-0362c76b9e8a0118a
}