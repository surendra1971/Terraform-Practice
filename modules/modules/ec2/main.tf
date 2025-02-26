resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

 provisioner "remote-exec" {
    inline = [
      "echo 'Hello from Terraform' > /home/ubuntu/hello.txt",
      "sudo yum update",
      "sudo yum install -y nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/home/ec2-user/Terraform-Practice/terraform.pem")
      host        = self.public_ip
    }
  }
}
