resource "aws_iam_role" "demo-node" {
  name = var.eks_role_name

  assume_role_policy = jsonencode(var.eks_role_policy)
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = var.worker_policy_arn
  role = aws_iam_role.demo-node.name
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKS_CNI_Policy" {
  policy_arn = var.cni_policy_arn
  role = aws_iam_role.demo-node.name
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = var.ecr_policy_arn
  role = aws_iam_role.demo-node.name
}

resource "aws_iam_instance_profile" "demo-node" {
  name = var.instance_profile_name
  role = aws_iam_role.demo-node.name
}

resource "aws_iam_role_policy" "autoscaler-policy" {
  name = "autoscaler-policy"
  role = aws_iam_role.demo-node.id

  policy = jsonencode(var.autoscaler_policy)
}
