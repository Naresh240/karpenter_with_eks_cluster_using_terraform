variable "region" {
  type = string
  default = "us-east-1"
}

variable "profile" {
  type = string
  default = "default"
}

variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
  default     = 2
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
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
  default     = 2
}

variable "min_size" {
  description = "The number of minimum nodes."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The number of maximum nodes."
  type        = number
  default     = 3
}

variable "karpenter_namespace" {
  type        = string
  default     = "karpenter"
}

variable "instance_type" {
  description = "Need to provide type of instance for EKS cluster nodes"
  type        = list(string)
  default     = ["t2.medium"]
}