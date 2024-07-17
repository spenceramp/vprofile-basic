resource "aws_security_group" "elb" {
  name        = "tf-vprofile-elb"
  description = "Security group for vprofile load balancer"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "tf-vprofile-elb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "elb_inbound" {
  security_group_id = aws_security_group.elb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port         = 80
}