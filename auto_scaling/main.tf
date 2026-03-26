resource "aws_launch_template" "lt" {
  name_prefix   = "my-template"
  image_id      = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = [var.subnet_id]

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}