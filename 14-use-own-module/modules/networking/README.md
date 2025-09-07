# Networking Module

This module manages the creation of VPCs and Subnets, allowing for the creation of both private and public subnets

Example usage:

```
module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "13-local-modules"
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
	subnet_3 = {
      cidr_block = "10.0.2.0/24"
      public     = true
      az         = "us-west-2c"
    }
	subnet_4 = {
      cidr_block = "10.0.3.0/24"
      az         = "us-west-2a"
    }
  }
}
```
