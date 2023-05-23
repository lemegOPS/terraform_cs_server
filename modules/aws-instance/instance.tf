#----------- AWS AMI & AMI data block ----------#

data "aws_ami" "image" {
  owners      = var.ami_image["ami_owners"]
  most_recent = true
  filter {
    name   = var.ami_image["ami_filter_name"]
    values = var.ami_image["ami_filter_value"]
  }
}

resource "aws_instance" "server" {
  ami                         = data.aws_ami.image.id
  instance_type               = lookup(var.instance_type, var.tags["Size"])
  user_data                   = templatefile("userdata.tpl", { game_port = var.sec_group_game_port })
  key_name                    = var.private_key_name
  vpc_security_group_ids      = [var.vpc_security_group]
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  tags = merge(var.tags, { Name = "${var.global_name}" })
}