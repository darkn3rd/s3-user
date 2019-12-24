resource "aws_iam_user" "default" {
  count         = var.enabled ? 1 : 0
  name          = var.name
  path          = var.path
  force_destroy = var.force_destroy
}

resource "aws_iam_access_key" "default" {
  count = var.enabled && var.access_key_enabled ? 1 : 0
  user  = aws_iam_user.default[0].name
}

data "aws_iam_policy_document" "default" {
  count = var.enabled ? 1 : 0

  statement {
    actions   = var.actions
    resources = var.resources
    effect    = "Allow"
  }
}

resource "aws_iam_user_policy" "default" {
  count  = var.enabled ? 1 : 0
  name   = var.name
  user   = var.name
  policy = data.aws_iam_policy_document.default[0].json
}
