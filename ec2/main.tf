resource "aws_instance" "example" {
    ami                        =  var.ami_id
    instance_type              =  var.instance_type
    security_groups =             [aws_security_group.allows_all.id]

}

resource "aws_security_group" "allows_all" {
  name        = "allows_tls"
  description = "Allows SSH inbound traffic"

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allows_tls"
  }
}

# Step 1 : Declaring the output that we wish to pass to the root Module
