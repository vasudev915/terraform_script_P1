# Private Subnet 1
resource "aws_subnet" "dev_pvt_sub1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "${var.subnet1_cidr}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "dev_pvt_sub"
  }
}

# Public Subnet 2
resource "aws_subnet" "dev_pub_sub" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "${var.subnet2_cidr}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "dev_pub_sub"
  }
}

# Public Subnet 3
resource "aws_subnet" "dev_pub_sub2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "${var.subnet3_cidr}"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "dev_pub_sub2"
  }
}
