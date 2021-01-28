# QUICKSTART:
# ssh-keygen -t rsa -b 4096 -f ./autored-key -C "autored"

variable "public_key_path" {
  description = "SSH public key associated with the instance"
  default     = "../../../autored-key.pub"
}
variable "private_key_path" {
  description = "SSH private key associated with the instance"
  default     = "../../../autored-key"
}
variable "dns_zone" {
  description = "The existing DNS zone reachable from the internet"
  default     = "example.pl."
}

variable "sendgrid_domain_auth" {
  description = "Set enter values in map if using sendgrid relay"
  type = map(string)
  default = {
    #"XXX.example.pl" = "XXX.example.net"
    #"s1._domainkey.example.pl" = "s1.domainkey.XXX.example.net"
    #"s2._domainkey.example.pl" = "s2.domainkey.XXX.example.net"
  }
}

# https://dev.to/david_j_eddy/tagging-with-terraform-5hn3
variable "tags" {
  type = map(string)
  default = {
    Name           = "Mail"
    DeploymentName = "AutoRedTeam"
  }
}

