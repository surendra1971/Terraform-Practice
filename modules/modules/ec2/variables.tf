variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = "ami-0005ee01bca55ab66"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = "t2.medium"
}
