# Note that permission sets are akin to IAM roles and attachments are IAM policies
# to provide privileged access to assigned AWS accounts.

###########################
# Generic permission sets #
###########################

# AdministratorAccess
resource "aws_ssoadmin_permission_set" "administrator-access" {
  name             = "AdministratorAccess"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "administrator-access-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.administrator-access.arn
}

# ViewOnlyAccess
resource "aws_ssoadmin_permission_set" "view-only-access" {
  name             = "ViewOnlyAccess"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "view-only-access-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.view-only-access.arn
}

# SecurityAudit
resource "aws_ssoadmin_permission_set" "security-audit" {
  name             = "SecurityAudit"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "security-audit-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  permission_set_arn = aws_ssoadmin_permission_set.security-audit.arn
}

# AWSSSOReadOnly
resource "aws_ssoadmin_permission_set" "aws-sso-readonly" {
  name             = "AWSSSOReadOnly"
  description      = "Read-only access to AWS SSO"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "aws-sso-readonly-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AWSSSOReadOnly"
  permission_set_arn = aws_ssoadmin_permission_set.aws-sso-readonly.arn
}

# DashboardAccess
resource "aws_ssoadmin_permission_set" "dashboard-access" {
  name             = "DashboardAccess"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "dashboard-access-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.dashboard-access.arn
}

################################
# OPG specific permission sets #
################################

# opg-security-audit
resource "aws_ssoadmin_permission_set" "opg-security-audit" {
  name             = "opg-security-audit"
  description      = "Allow SecOps access into OPG accounts"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "opg-security-audit-policy-guardduty" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonGuardDutyReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.opg-security-audit.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "opg-security-audit-policy-security" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  permission_set_arn = aws_ssoadmin_permission_set.opg-security-audit.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "opg-security-audit-policy-security-hub" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AWSSecurityHubReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.opg-security-audit.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "opg-security-audit-policy-cloudtrail" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AWSCloudTrailReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.opg-security-audit.arn
}

# opg-viewer
resource "aws_ssoadmin_permission_set" "opg-viewer" {
  name             = "opg-viewer"
  description      = "Standard viewer role given to all members of OPG Digital"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT2H"
}

resource "aws_ssoadmin_managed_policy_attachment" "opg-viewer-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.opg-viewer.arn
}

# opg-breakglass
resource "aws_ssoadmin_permission_set" "opg-breakglass" {
  name             = "opg-breakglass"
  description      = "Breakglass role given to the webops engineers at OPG incase of emergencies"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "opg-breakglass-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.opg-breakglass.arn
}

##################################################
# Modernisation Platform specific permision sets #
##################################################

# The Modernisation Platform provides teams with view-only access,
# but write permissions for Secrets Manager and SSM to initialise
# secrets with their first value.
resource "aws_ssoadmin_permission_set" "modernisation-platform-viewer" {
  name             = "modernisation-platform-viewer"
  instance_arn     = local.sso_instance_arn
  session_duration = "PT1H"
}

resource "aws_ssoadmin_managed_policy_attachment" "modernisation-platform-viewer-policy" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.modernisation-platform-viewer.arn
}

data "aws_iam_policy_document" "secretsmanager-and-ssm" {
  statement {
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",
      "secretsmanager:PutSecretValue",
      "secretsmanager:UpdateSecret",
      "secretsmanager:RestoreSecret",
      "ssm:PutParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:DescribeParameters",
    ]

    resources = ["*"]
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "modernisation-platform-viewer-secrets" {
  inline_policy      = data.aws_iam_policy_document.secretsmanager-and-ssm.json
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.modernisation-platform-viewer.arn
}
