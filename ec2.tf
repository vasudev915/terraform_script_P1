#creating 1st ec2 instace in public subneyt
resource "aws_instance" "dev_ins-1" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "dev"
  vpc_security_group_ids      = [aws_security_group.dev_sg.id]
  subnet_id                   = aws_subnet.dev_pub_sub.id
  associate_public_ip_address = "true"
  user_data                   = file("userdata.sh")

  tags = {
    Name = "instance_pub1"
  }
}

# creating 2nd ec2 instace in public subneyt
resource "aws_instance" "dev_ins-2" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "dev"
  vpc_security_group_ids      = [aws_security_group.dev_sg.id]
  subnet_id                   = aws_subnet.dev_pub_sub2.id
  associate_public_ip_address = "true"
  user_data                   = file("userdata.sh")

  tags = {
    Name = "instance_pub2"
  }
}

#creating 3rd ec2 instace in private subneyt
resource "aws_instance" "dev_ins-3" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  count                       = 1
  key_name                    = "dev"
  vpc_security_group_ids      = [aws_security_group.dev_sg.id]
  subnet_id                   = aws_subnet.dev_pvt_sub1.id
  associate_public_ip_address = "false"
  user_data                   = ""

  tags = {
    Name = "instance_pvt"
  }
}
