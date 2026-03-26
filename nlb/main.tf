resource "aws_lb" "nlb" {
  name               = "terraform-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnets
}

resource "aws_lb_target_group" "tg" {
    name        = "nlb-target-group"
    port        = 80
    protocol    = "TCP"
    vpc_id      = "var.vpc_id"
}