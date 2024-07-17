resource "aws_security_group" "elb" {
  name        = "tf-vprofile-elb"
  description = "Security group for vprofile load balancer"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name = "tf-vprofile-elb"
  }
 ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

