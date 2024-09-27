variable "tags" {
  type = map(string)
  default = {
    DeploymentName        = "AutoRedTeam"
  }
}
variable "aws_vpc" {
  description = "The AWS VPC."
}
variable "aws_subnet" {
  description = "The AWS VPC subnet for cluster deployment."
}
variable "keypair" {
  description = "The SSH key for the ec2 instances."
}
variable "ports" {
  description = "The AWS Security Group for the cluster."
  type = list(object({
    port = number
    protocol = string
    cidr = list(string)
  }))
  default = [
    {
      port = 22
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 80
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 443
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    }
  ]
}
variable "ami" {
  type = string
  # https://cloud-images.ubuntu.com/locator/ec2/
  # us-east-1	Jammy Jellyfish	22.04 LTS	amd64	hvm:ebs-ssd	20230728
  default = "ami-02675d30b814d1daa"
}
variable "instance_type" {
  type = string
  default = "t3.micro"
}
variable "instance_count" {
  type = number
  default = 1
}
