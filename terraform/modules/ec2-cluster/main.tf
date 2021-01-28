# The security group to access for the cluster
resource "aws_security_group" "default" {
  tags = var.tags
  vpc_id = var.aws_vpc.id
  dynamic "ingress" {
    for_each = var.ports
    content {
        from_port   = ingress.value.port
        to_port     = ingress.value.port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr
      }
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ec2_cluster" {
  tags                    = var.tags
  count                   = var.instance_count
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.keypair.id
  vpc_security_group_ids  = [aws_security_group.default.id]
  subnet_id               = var.aws_subnet.id
}
resource "aws_eip" "ec2_cluster" {
  count     = var.instance_count
  instance  = aws_instance.ec2_cluster[count.index].id
}