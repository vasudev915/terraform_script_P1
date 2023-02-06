# Internet Gateway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev_igw"
  }
}
