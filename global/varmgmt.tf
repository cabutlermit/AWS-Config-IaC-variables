# Variables for global-global

# This sets the target workspace in TfCloud
data "tfe_workspace" "global-global" {
    name            = "AWS-Config-IaC-global-global"
    organization    = "cabutler-private"
}

# This sets the parameter source in AWS Parameter Store
data "aws_ssm_parameter" "tf-global-users-global" {
    name    = "tf-global-users-global"
}

# This writes the data from the parameter source to the target workspace
resource "tfe_variable" "users" {
    key             = "users"
    value           = data.aws_ssm_parameter.tf-global-users-global.value
    hcl             = "true"
    category        = "terraform"
    workspace_id    = data.tfe_workspace.global-global.id
    description     = "list of iam user accounts"
}

# This sets the parameter source in AWS Parameter Store
data "aws_ssm_parameter" "tf-global-admins-global" {
    name    = "tf-global-admins-global"
}

# This writes the data from the parameter source to the target workspace
resource "tfe_variable" "admins" {
    key             = "admins"
    value           = data.aws_ssm_parameter.tf-global-admins-global.value
    hcl             = "true"
    category        = "terraform"
    workspace_id    = data.tfe_workspace.global-global.id
    description     = "list of iam admin accounts"
}