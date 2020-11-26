# OPG OU: Use My LPA
resource "aws_organizations_account" "opg-use-my-lpa-production" {
  name      = "OPG Use My LPA Production"
  email     = local.account_emails["OPG Use My LPA Production"][0]
  parent_id = aws_organizations_organizational_unit.opg-use-my-lpa.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_account" "opg-use-my-lpa-preproduction" {
  name      = "OPG Use My LPA Preproduction"
  email     = local.account_emails["OPG Use My LPA Preproduction"][0]
  parent_id = aws_organizations_organizational_unit.opg-use-my-lpa.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}

resource "aws_organizations_account" "opg-use-my-lpa-development" {
  name      = "OPG Use My LPA Development"
  email     = local.account_emails["OPG Use My LPA Development"][0]
  parent_id = aws_organizations_organizational_unit.opg-use-my-lpa.id

  lifecycle {
    # If any of these attributes are changed, it attempts to destroy and recreate the account,
    # so we should ignore the changes to prevent this from happening.
    ignore_changes = [
      name,
      email,
      iam_user_access_to_billing,
      role_name
    ]
  }
}
