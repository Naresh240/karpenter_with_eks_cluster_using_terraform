variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "demoeks"
    "Environment" = "Development"
    "Owner"       = "Naresh"
  }
}

variable "desired_size" {
  description = "The number of desired nodes."
  type        = number
}

variable "min_size" {
  description = "The number of minimum nodes."
  type        = number
}

variable "max_size" {
  description = "The number of maximum nodes."
  type        = number
}