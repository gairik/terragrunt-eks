
terraform {
  source = "../../../..//modules/eks"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}


inputs = {
  eks_role_name = "terraform-eks-demo-node"
  eks_role_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  }
  instance_profile_name = "terraform-eks-demo"
  worker_policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  cni_policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ecr_policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  autoscaler_policy = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeInstanceTypes",
          "autoscaling:DescribeTags",
          "autoscaling:DescribeLaunchConfigurations"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  }
}
