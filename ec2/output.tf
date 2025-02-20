output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example
}

output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "private_ip" {
  description = "The private IP of the EC2 instance"
  value       = aws_instance.example.private_ip
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.example.ami
}
