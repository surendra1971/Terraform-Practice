resource "aws_instance" "example" {
    ami                        =  var.ami_id
    instance_type              =  var.instance_type

    tags = {
       Name = "Linus_Server_With_Remote_Backend"
  
}
