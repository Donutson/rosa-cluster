resource "aws_key_pair" "main" {
  key_name   = var.tags["Application"]
  public_key = file("${var.ssh_key_path}.pub")

  tags = merge(
    tomap({ "Name" = "key_pair_${var.tags["Application"]}_${var.tags["Environment"]}" }),
    var.tags
  )
}
