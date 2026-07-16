variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnetcidrblock" {
  default = "10.0.1.0/24"
}

variable "aility_zone" {
  default = "ap-south-1a"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "gowthamkeypair2"
}

variable "my_ip" {
  description = "Your IP for SSH access, in CIDR format e.g. 1.2.3.4/32"
  default     = "0.0.0.0/0"
}

variable "node_names" {
  default = ["master", "node1", "node2", "node3", "node4"]
}

