variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "The type of the managed EC2 instances."

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micros and t3.micro"
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and type of the root block volume attached to managed EC2 instances."

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "my_sensitive_value" {
  type        = string
  description = "A sensitive value that should not be logged or displayed in the console."
  sensitive   = true

}
