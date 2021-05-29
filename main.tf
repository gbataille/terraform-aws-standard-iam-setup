data aws_caller_identity "current" {}

data aws_iam_policy_document "assume_for_iam_user_in_current_account" {
  policy_id = "assume_for_iam_user_in_current_account"

  statement {
    sid     = "AssumeRoleForHuman"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [ "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
  }
}

resource aws_iam_role "role_admin" {
  count = var.create_admin_role ? 1 : 0

  name                 = "role_admin"
  assume_role_policy   = data.aws_iam_policy_document.assume_for_iam_user_in_current_account.json
  max_session_duration = var.role_admin_max_session_duration_sec
}

resource aws_iam_role_policy_attachment "role_admin" {
  count = var.create_admin_role ? 1 : 0

  role       = aws_iam_role.role_admin[0].name
  policy_arn = var.role_admin_policy_arn
}

resource aws_iam_role "role_readonly" {
  count = var.create_readonly_role ? 1 : 0

  name                 = "role_readonly"
  assume_role_policy   = data.aws_iam_policy_document.assume_for_iam_user_in_current_account.json
  max_session_duration = var.role_readonly_max_session_duration_sec
}

resource aws_iam_role_policy_attachment "role_readonly" {
  count = var.create_readonly_role ? 1 : 0

  role       = aws_iam_role.role_readonly[0].name
  policy_arn = var.role_readonly_policy_arn
}
