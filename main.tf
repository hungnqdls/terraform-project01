provider "aws" {
    region = var.region_aws
}

module "network" {
    source = "./network"
}

module "computing" {
    source = "./compute"
    priv_subnets = module.network.public-subnets
    pub_subnets  = module.network.private-subnets
    vpc-id = module.network.vpc-id
    pub_subnet1 = module.network.pub_subnet1
    pub_subnet2 = module.network.pub_subnet2
    priv_subnet1 = module.network.priv_subnet1
    priv_subnet2 = module.network.priv_subnet2
}

module "loadbalancer" {
    source = "./alb"
    instance1_id = module.computing.instance1_id
    instance2_id = module.computing.instance2_id
    alb_sg = module.computing.alb_sg
    vpc-id = module.network.vpc-id 
    pub_subnet1 = module.network.pub_subnet1
    pub_subnet2 = module.network.pub_subnet2
}
module "autoscale" {
    source = "./autoscale"
    pub_subnet1 = module.network.pub_subnet1 
    pub_subnet2 = module.network.pub_subnet2 
    vpc-id = module.network.vpc-id 
    webapp_sg = module.computing.webapp_sg
    alb_dns_name = module.loadbalancer.alb_dns_name
    alb_target_group_arn = module.loadbalancer.alb_target_group_arn
}