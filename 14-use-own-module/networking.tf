module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "14-use-own-module"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.0.0/24"
      az         = "us-west-2a"
    }
    subnet_2 = {
      cidr_block = "10.0.1.0/24"
      public     = true
      az         = "us-west-2b"
    }
  }
}
