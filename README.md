# Terraform-aws-standard-role-access

## Description

This module creates basic roles that are handy for any AWS account that uses IAM Roles to manage
access of human users.

2 roles typically often exist:
* a `role_readonly` that is used to browse AWS resources without risk
* a `role_admin` that has administrative access to modify the resources in the AWS account

## Configurability

This module has limited configuratibility on purpose. It is based on some common setup for small
accounts. It actually does not contain anything fancy, but simply some common recipes the author has
been using on several occasions.

In a context where non negligible customization is needed, please just take a copy of the resources
and change as appropriate
