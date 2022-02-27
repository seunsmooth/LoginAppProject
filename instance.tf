resource "aws_key_pair" "sparrow" {
  key_name   = "sparrow-key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

module "ec2_clusters" {
  for_each       = { "apache" = [module.vpc.public_subnets[0], "eu-west-1c"], "python" = [module.vpc.public_subnets[0], "eu-west-1a"], "rds_server" = [module.vpc.public_subnets[1], "eu-west-1a"], "redis" = [module.vpc.public_subnets[0], "eu-west-1a"] }
  source         = "terraform-aws-modules/ec2-instance/aws"
  version        = "~> 3.0"
  name           = "${each.key}_Server"
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "${aws_key_pair.sparrow.key_name}"
  monitoring             = true
  availability_zone                = each.value[0]
  vpc_security_group_ids = [aws_security_group.sg-sparrow.id]
  subnet_id              = each.value[0] #module.vpc.private_subnets[0]
  tags            = var.generic
  
}




