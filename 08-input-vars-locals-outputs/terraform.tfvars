ec2_instance_type = "t3.micro"
ec2_volume_config = {
  size = 10
  type = "gp3"
}

additional_tags = {
  ValuesFrom = "terraform.tfvars"
}
