# eu-west-2 provider for the Organisation Security account
provider "aws" {
  region = "eu-west-2"
  alias  = "organisation-security-eu-west-2"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.organisation-security.id}:role/OrganizationAccountAccessRole"
  }
}
