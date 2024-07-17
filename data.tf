data "aws_vpc" "vpc" {
  tags = {
    Name   = "default_vpc"
  }
}