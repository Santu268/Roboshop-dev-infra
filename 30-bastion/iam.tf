resource "aws_iam_role" "roboshop-dev" {
  name = "${local.common_name}-${var.component}"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
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
  })

  tags = merge (
    local.common_tags,
    {
        Name = "${local.common_name}-${var.component}"
    }
  )
}

resource "aws_iam_role_policy_attachment" "policy-attach" {
  role       = aws_iam_role.roboshop-dev.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${local.common_name}-${var.component}"
  role = aws_iam_role.roboshop-dev.name
}