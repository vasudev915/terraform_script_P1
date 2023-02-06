# VPC

resource "aws_vpc" "dev" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "dev"
  }
}
