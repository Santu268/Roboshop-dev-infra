resource "aws_instance" "main" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  user_data = templatefile("${path.module}/userdata.sh.tftpl", {
    partition_num = local.partition_num
    size        = local.size
  })
    root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
    tags = local.common_tags
  }

  tags = local.common_tags
}