variable "project" {
  type        = string
  default = "roboshop"
 }

variable "env" {
  type   = string
  default = "dev"
 }

 variable "instance_type" {
  type   = string
  default = "t3.micro"
    validation {
    condition = contains(["t3.micro","t3.small","t3.medium"],var.instance_type)
    error_message = " instance_type must be one of: t3.micro, t3.small, t3.medium."
    }
 }

 variable "bastion_tags"{
    type = map
    default ={}
 }

 variable "component"{
    type = string
    default = "bastion"
 }
