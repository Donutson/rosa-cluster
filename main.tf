resource "aws_instance" "main" {
  ami                    = var.ec2.ami
  instance_type          = var.ec2.type
  key_name               = aws_key_pair.main.key_name
  subnet_id              = module.vpc.subnet_id
  vpc_security_group_ids = [module.vpc.security_group_id]

  connection {
    type        = var.ec2.connection.type
    user        = var.ec2.connection.user
    private_key = file(var.ssh_key_path)
    host        = self.public_ip
  }


  provisioner "remote-exec" {
    inline = local.scripts
  }

  tags = merge(
    tomap({ "Name" = "ec2_${var.tags["Application"]}_${var.tags["Environment"]}" }),
    var.tags
  )
}
