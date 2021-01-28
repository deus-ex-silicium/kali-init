variable "cird_vpc"{
  description = "The CIRD block of the VPC"
  default = "10.0.0.0/16"
}
variable "cidr_subnet"{
  description = "The CIRD block of the VPC subnet"
  default = "10.0.1.0/24"
}
variable "tags" {
  type = map(string)
  default = {
    DeploymentName        = "AutoRedTeam"
  }
}