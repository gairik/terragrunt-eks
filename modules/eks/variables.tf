variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = string
}

variable "eks_role_name" {
  description = "Name of the EKS IAM role"
  type        = string
}

variable "eks_role_policy" {
  description = "IAM role assume role policy"
  type        = any
}

variable "instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
}

variable "worker_policy_arn" {
  description = "ARN of the AmazonEKSWorkerNodePolicy"
  type        = string
}

variable "cni_policy_arn" {
  description = "ARN of the AmazonEKS_CNI_Policy"
  type        = string
}

variable "ecr_policy_arn" {
  description = "ARN of the AmazonEC2ContainerRegistryReadOnly"
  type        = string
}

variable "autoscaler_policy" {
  description = "IAM role autoscaler policy"
  type        = any
}
