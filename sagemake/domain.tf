resource "aws_sagemaker_domain" "sagemakeAYO" {
  domain_name = "sagemakeAYO"
  auth_mode   = "IAM"
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids

  default_user_settings {
    execution_role = aws_iam_role.sagemakeAYO.arn
  }
  tags = var.tags
}

resource "aws_iam_role" "sagemakeAYO" {
  name               = "sagemakeAYO"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.sagemakeAYO.json
  tags = var.tags
}

data "aws_iam_policy_document" "sagemakeAYO" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_sagemaker_user_profile" "example" {
  domain_id         = aws_sagemaker_domain.sagemakeAYO.id
  user_profile_name = "generalUser"
  tags = var.tags
}

module "registry_policy_attachement_policy_sagemake" {
    source         = "../infra/modules/iam-policy-attachement"
    role_name      = aws_iam_role.sagemakeAYO.name
    policy_arn     = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"

}
