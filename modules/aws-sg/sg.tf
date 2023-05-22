#---------- Security Group block ----------#

resource "aws_security_group" "vpc_security_group" {
  name   = "${var.global_name}_SG"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.sec_group["port_tcp"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sec_group["external"]]
    }
  }
  dynamic "ingress" {
    for_each = var.sec_group["port_udp"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "udp"
      cidr_blocks = [var.sec_group["external"]]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.sec_group["external"]]
  }
  tags = var.propper_tags
}