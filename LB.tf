#creating exyternal loadbalancer
resource "aws_lb" "external-lb" {
  name               = "external-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.dev_sg.id]
  subnets            = [aws_subnet.dev_pub_sub.id, aws_subnet.dev_pub_sub2.id]
}
resource "aws_lb_target_group" "target-lb" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.dev.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target-lb.arn
  target_id        = aws_instance.dev_ins-1[0].id
  port             = 80
  depends_on = [
    aws_instance.dev_ins-1,
  ]
}
resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target-lb.arn
  target_id        = aws_instance.dev_ins-2[0].id
  port             = 80
  depends_on = [
    aws_instance.dev_ins-2,
  ]
}
resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-lb.arn
  }
}
