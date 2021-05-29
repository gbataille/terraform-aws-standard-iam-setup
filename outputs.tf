output "role_admin_name" {
  value = var.create_admin_role ? aws_iam_role.role_admin[0].name : null
}

output "role_readonly_name" {
  value = var.create_readonly_role ? aws_iam_role.role_readonly[0].name : null
}
