module "sgs" {
    source = "../sg_eks"
    vpc_id     =     aws_vpc.dpp-vpc.id
  }

  module "eks" {
      source = "../eks"
       vpc_id     =     aws_vpc.dpp-vpc.id
       subnet_ids = [aws_subnet.dpp-public-subnet-01.id,aws_subnet.dpp-public-subnet-02.id]
      sg_ids = module.sgs.security_group_public
  }
