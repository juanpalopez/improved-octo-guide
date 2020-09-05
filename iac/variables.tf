variable "region" {
  default = "eu-west-1"
}

variable "environment_tag" {
  default = "dev"
}

variable "eks_instance_max_count" {
  type = number
  description = "Max number of instances for EKS cluster"
  default = 2
}

variable "eks_instance_type" {
  type = string
  description = "Instance type for EKS cluster"
  default = "t3.large"
}