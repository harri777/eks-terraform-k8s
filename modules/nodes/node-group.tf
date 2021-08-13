resource "aws_eks_node_group" "cluster" {
  cluster_name = var.eks_cluster.name
  node_group_name = format("%s-node-group", var.cluster_name)
  node_role_arn = aws_iam_role.eks_nodes_roles.arn

  subnet_ids = [
    var.private_subnet_1a.id,
    var.private_subnet_1b.id
  ]

  instance_types = var.nodes_instances_sizes

  scaling_config {
    desired_size    = lookup(var.auto_scale_options, "desired")
    max_size        = lookup(var.auto_scale_options, "max")
    min_size        = lookup(var.auto_scale_options, "min")
  }

  depends_on = [
    aws_iam_role_policy_attachment.node,
    aws_iam_role_policy_attachment.cni,
    aws_iam_role_policy_attachment.ecr
  ]

}