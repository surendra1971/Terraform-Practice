resource "aws_s3_bucket" "my_test_bucket" {
  bucket = "test-bucket-2-for-import"
  tags = {
    "name" = "test-bucket"
  }
}

resource "aws_instance" "ec2_example" {
   ami           = "ami-0767046d1677be5a0"
   instance_type =  "t2.micro"

   tags = {
           Name = "Terraform EC2"
   }
  depends_on = [aws_s3_bucket.my_test_bucket]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfMKjQqoCx+F3zqQTvzejXmqvZWyB9bKePJbIEuS8lB surendra@LAPTOP-OGCF8IH7"
}
