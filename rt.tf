# Public route table
resource "aws_route_table" "dev_pub_rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name = "dev_pub_rt"
  }
}

# Private route table
resource "aws_route_table" "dev_pvt_rt" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev_pvt_rt"
  }
}
