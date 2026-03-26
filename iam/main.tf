resource "aws_iam_user" "user" {
  name = var.user_name
}

resource "aws_iam_group" "group" {
  name = var.group_name
}

resource "aws_iam_user_group_membership" "membership" {
  user = aws_iam_user.user.name
  groups = [aws_iam_group.group.name]
}

resource "aws_iam_policy" "policy" {
  name = "S3FullAccessPolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = "s3:*"
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_group_policy_attachment" "attach" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}