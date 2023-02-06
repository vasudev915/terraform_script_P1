#creating RDS instance
resource "aws_db_subnet_group" "default" {
  name = "main"
  subnet_ids = [aws_subnet.dev_pub_sub.id, aws_subnet.dev_pub_sub2.id]
tags = {
  Name = "MyDBSG"
}
}
resource "aws_db_instance" "default" {
  allocated_storage = 10
  db_subnet_group_name = aws_db_subnet_group.default.id
  engine = "mysql"
  engine_version = "8.0.30"
  instance_class = "db.t2.micro"
  multi_az = true
  name = "mydb"
  username = "username"
  password = "password"
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}
