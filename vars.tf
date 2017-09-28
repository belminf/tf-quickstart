variable "project_name" {
  type = "string"
  description = "Name of project, used for tag"
}

variable "github_user" {
  type = "string"
  description = "Github user, used to get public keys"
}

variable "bastion_user" {
  type = "string"
  description = "Linux user to create"
}

variable "key_name" {
  type = "string"
  description = "Key pair name for bastion"
}

variable "region" {
  type = "string"
  default     = "us-east-1"
  description = "AWS region"
}

variable "remote_cidr_list" {
    type = "list"
    description = "List of CIDRs to get remote access"
}

variable "bastion_instance_type" {
  type = "string"
  description = "AWS instance type for bastion"
}

variable "bastion_ami" {
  type = "string"
  description = "AMI for bastion, assuming Linux"
}

variable "bastion_root_gb" {
  type = "string"
  description = "Root volume size (GB) for bastion"
}

variable "bastion_root_type" {
  type = "string"
  description = "Root volume type for bastion"
}
