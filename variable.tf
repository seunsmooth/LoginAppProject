variable "owner" {
  default = "olu awoga"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0ec23856b3bad62d3"
}


variable "key" {
  default = "terraform22"
}

variable "generic" {
  type = map(any)
  default = {
    Name = "app",
    env  = "dev",
    dept = "finance"
  }
}

variable "az_zone" {
   default =   ["eu-west-1a", "eu-west-1c"]
}

variable "region" {
  default = "eu-west-1"
}
variable "instance_count" {
  default = 1
}

variable "vpc_cidr" {
  default = "10.7.0.0/16"
}
#
#ariable "account" {
# type = list
# default = {
#   #Prometheus = module.vpc.private_subnets[0] #"subnet-08dac839bf5fc78a1"
#   Grafana    =  module.vpc.public_subnets[0]  #"subnet-05625e43abcf7aa65"
# }
#


variable "private_subnets" {
  default = ["10.7.1.0/24", "10.7.2.0/24", "10.7.3.0/24"]
}

variable "public_subnets" {
  default = ["10.7.10.0/24", "10.7.20.0/24", "10.7.30.0/24"]
}




variable "white_listed_entrants" {
  default = ["87.80.20.214/32", "0.0.0.0/0"]
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "sparrow.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "sparrow"
}