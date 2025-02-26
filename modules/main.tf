provider "aws" {
  region = "us-west-2"
}

module "ec2_instance" {
  source        = "./modules/ec2"
  ami_id        = "ami-0005ee01bca55ab66"   # Example AMI ID
  instance_type = "t2.micro"
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}
