# Create a VPC to launch our instances into
resource "aws_vpc" "default" {
  tags = var.tags
  cidr_block = var.cird_vpc
}
# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "default" {
  tags = var.tags
  vpc_id = aws_vpc.default.id
}
# Grant the VPC internet access on its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}
# Create a subnet to launch our instances into
resource "aws_subnet" "default" {
  tags = var.tags
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.cidr_subnet
  map_public_ip_on_launch = true
}