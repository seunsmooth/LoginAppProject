data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-sparrow"
  cidr = var.vpc_cidr

  azs                              = ["eu-west-1a", "eu-west-1c"]
  private_subnets                  = var.private_subnets 
  public_subnets                   = var.public_subnets
  enable_dns_hostnames             = false
  enable_dns_support               = false
  #enable_ec2_endpoint              = false
  #ec2_endpoint_private_dns_enabled = true
  #ec2_endpoint_security_group_ids  = [data.aws_security_group.default.id]
  enable_nat_gateway = false
  enable_vpn_gateway = false
 
}