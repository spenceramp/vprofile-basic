resource "aws_security_group" "elb_sg" {
  name        = "tf-vprofile-elb-SG"
  description = "Security group for vprofile load balancer allows from public"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
  tags = {
    Name = "tf-vprofile-elb"
  }
}


resource "aws_security_group" "tomcat_sg" {
  name        = "tf-vprofile-tomcat-SG"
  description = "Security group for vprofile tomcat instance allows access from load balancer"
  vpc_id      = data.aws_vpc.main.id


  ingress {
    security_groups = [aws_security_group.elb_sg.id]
    from_port       = 8080
    protocol        = "tcp"
    to_port         = 8080
  }

  ingress {
    cidr_blocks = ["${trimspace(data.http.my_ip.response_body)}/32"]
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
  }

  ingress {
    cidr_blocks = ["${trimspace(data.http.my_ip.response_body)}/32"]
    from_port       = 8080
    protocol        = "tcp"
    to_port         = 8080
  }

  tags = {
    Name = "tf-vprofile-tomcat-instance"
  }
}


resource "aws_security_group" "backend" {
  name        = "tf-vprofile-backend-SG"
  description = "Security group for vprofile backend allows access app servers"
  vpc_id      = data.aws_vpc.main.id


  ingress {
    security_groups = [aws_security_group.tomcat_sg.id]
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    description     = "Allows 3306 from app servers"
  }

  ingress {
    security_groups = [aws_security_group.tomcat_sg.id]
    from_port       = 11211
    protocol        = "tcp"
    to_port         = 11211
    description     = "Allows 11211 from app servers"
  }

  ingress {
    security_groups = [aws_security_group.tomcat_sg.id]
    from_port       = 5672
    protocol        = "tcp"
    to_port         = 5672
    description     = "Allows 5672 from app servers"
  }

  ingress {
    self            = true
    from_port       = 0
    protocol        = "tcp"
    to_port         = 0
    description     = "Allows all instances within this SG to communicate"
  }

  ingress {
    cidr_blocks = ["${trimspace(data.http.my_ip.response_body)}/32"]
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
  }

  tags = {
    Name = "tf-vprofile-backend"
  }
}
