/*
	{
	  username: string
	  roles: string[]
	}[],
	{
	  username => roles
	}
*/

locals {
  users_from_yaml = yamldecode(file("${path.module}/user-roles.yaml"))
  
  # Group users by username and combine their roles
  users_map = {
    for username in distinct(local.users_from_yaml.users[*].username) : username => distinct(flatten([
      for user_config in local.users_from_yaml.users : user_config.roles if user_config.username == username
    ]))
  }
}

resource "aws_iam_user" "users" {
  for_each = toset(local.users_from_yaml.users[*].username)
  name     = each.value
}

resource "aws_iam_user_login_profile" "users" {
  for_each        = aws_iam_user.users
  user            = each.key
  password_length = 8

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
}

output "passwords" {
  value     = { for user, user_login in aws_iam_user_login_profile.users : user => user_login.password }
  sensitive = true
}

output "users" {
  value = local.users_from_yaml
}
