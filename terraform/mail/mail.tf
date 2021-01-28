# https://www.terraform.io/docs/configuration/expressions.html

provider "aws" {
  region = "us-east-1"
}
module "vpc_bootstrap" {
  source  = "../modules/vpc-bootstrap"
  tags    = var.tags
}
resource "aws_key_pair" "mail_key" {
  key_name   = "AutoRedTeamKey"
  public_key = file(var.public_key_path)
}
module "mail_cluster"{
  source          = "../modules/ec2-cluster"
  tags            = var.tags
  aws_vpc         = module.vpc_bootstrap.aws_vpc
  aws_subnet      = module.vpc_bootstrap.aws_subnet
  keypair         = aws_key_pair.mail_key
  instance_count  = 1
  ports = [
    {
      port = 22
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 25 # SMTP
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 465 # SMTPS
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 587 # submission
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 143 # IMAP
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    },
    {
      port = 993 # IMAPS
      protocol = "tcp"
      cidr = ["0.0.0.0/0"]
    }
  ]
}

data "aws_route53_zone" "vhosts" {
  name = var.dns_zone
}

resource "aws_route53_record" "sendgrid_cname" {
  for_each  = var.sendgrid_domain_auth
  zone_id   = data.aws_route53_zone.vhosts.zone_id
  name      = each.key
  type      = "CNAME"
  ttl       = "300"
  records   = [each.value]
}

# ansible hosts file generator
resource "local_file" "ansible_hosts" {
  filename = "./ansible_hosts"
  file_permission = 0640
  content = <<EOT
[server_mail]
${module.mail_cluster.eip[0].public_ip}
EOT
}
output "provision_command" {
  value = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ../../ansible/art-mail.yaml -u ubuntu --private-key ${var.private_key_path} -i ansible_hosts"
}

