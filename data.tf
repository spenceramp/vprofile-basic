data "http" "my_ip" {
  url = "http://checkip.amazonaws.com/"
}

data "aws_vpc" "main" {
  id = "vpc-0938b935d4445e4db"
  tags = {
    Name = "default_vpc"
  }
}