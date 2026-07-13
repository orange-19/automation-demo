resource "aws_instance" "nodes" {
  for_each = toset(var.node_names)

  ami                    = "ami-01a00762f46d584a1"
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.automation-demo-subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = each.value
    Role = each.value == "master" ? "master" : "worker"
  }
}

resource "aws_eip" "master_eip" {
  domain   = "vpc"
  instance = aws_instance.nodes["master"].id

  tags = {
    Name = "master-eip"
  }

  depends_on = [aws_instance.nodes]
}