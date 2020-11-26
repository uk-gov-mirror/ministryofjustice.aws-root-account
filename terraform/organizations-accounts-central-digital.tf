# Central Digital OU
resource "aws_organizations_account" "parliamentary-questions" {
  name      = "Parliamentary Questions"
  email     = local.account_emails["Parliamentary Questions"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "parliamentary-questions" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.parliamentary-questions.id
}

resource "aws_organizations_account" "cloud-networks-psn" {
  name      = "Cloud Networks PSN"
  email     = local.account_emails["Cloud Networks PSN"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "cloud-networks-psn" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.cloud-networks-psn.id
}

resource "aws_organizations_account" "moj-digital-services" {
  name      = "MoJ Digital Services"
  email     = local.account_emails["MoJ Digital Services"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "moj-digital-services" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-digital-services.id
}

resource "aws_organizations_account" "platforms-non-production" {
  name      = "platforms-non-production"
  email     = local.account_emails["platforms-non-production"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "platforms-non-production" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.platforms-non-production.id
}

resource "aws_organizations_account" "network-architecture" {
  name      = "Network Architecture"
  email     = local.account_emails["Network Architecture"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "network-architecture" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.network-architecture.id
}

resource "aws_organizations_account" "moj-peoplefinder" {
  name      = "MoJ PeopleFinder"
  email     = local.account_emails["MoJ PeopleFinder"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "moj-peoplefinder" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-peoplefinder.id
}

resource "aws_organizations_account" "moj-cla" {
  name      = "MoJ CLA"
  email     = local.account_emails["MoJ CLA"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "moj-cla" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.moj-cla.id
}

resource "aws_organizations_account" "patterns" {
  name      = "Patterns"
  email     = local.account_emails["Patterns"][0]
  parent_id = aws_organizations_organizational_unit.central-digital.id

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

resource "aws_organizations_policy_attachment" "patterns" {
  policy_id = "p-FullAWSAccess"
  target_id = aws_organizations_account.patterns.id
}
