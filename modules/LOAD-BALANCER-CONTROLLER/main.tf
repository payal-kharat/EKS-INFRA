# resource "aws_iam_role" "THIS" {
#   name = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-aws-load-balancer-controller-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Federated = var.EKS_OIDC_PROVIDER_ARN
#         }
#         Action = "sts:AssumeRoleWithWebIdentity"
#         Condition = {
#           StringEquals = {
#             "${var.EKS_OIDC_PROVIDER}:aud" = "sts.amazonaws.com"
#             "${var.EKS_OIDC_PROVIDER}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
#           }
#         }
#       }
#     ]
#   })

#   tags = var.COMMON_TAGS
# }

# resource "aws_iam_policy" "THIS" {
#   name        = "${var.PROJECT_NAME}-${var.ENVIRONMENT}-aws-load-balancer-controller-policy"
#   description = "IAM permissions for AWS Load Balancer Controller"

#   # Replace this placeholder with the complete, version-matched
#   # AWS Load Balancer Controller policy document.
#   policy = jsonencode({
#     Version   = "2012-10-17"
#     Statement = []
#   })

#   tags = var.COMMON_TAGS
# }

# resource "aws_iam_role_policy_attachment" "THIS" {
#   role       = aws_iam_role.THIS.name
#   policy_arn = aws_iam_policy.THIS.arn
# }



resource "kubernetes_service_account" "THIS" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = var.IAM_ROLE_ARN
    }
  }
}

resource "helm_release" "THIS" {
  name             = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  chart            = "aws-load-balancer-controller"
  namespace        = "kube-system"
  create_namespace = false
  timeout          = 600
  wait             = true

  set = [
    {
      name  = "clusterName"
      value = var.CLUSTER_NAME
    },
    {
      name  = "region"
      value = var.AWS_REGION
    },
    {
      name  = "vpcId"
      value = var.VPC_ID
    },
    {
      name  = "serviceAccount.create"
      value = "false"
    },
    {
      name  = "serviceAccount.name"
      value = kubernetes_service_account.THIS.metadata[0].name
    }
  ]

  depends_on = [kubernetes_service_account.THIS]
}
