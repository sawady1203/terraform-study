provider "google" {
  project = var.bootstrap_project
  region  = "asia-northeast1"
}

module "${APP_ENV}_folder" {
  source      = "../../modules/folder"
  folder_name = "${APP_NAME}-${ENV}"
  parent      = "organizations/${ORG_ID_PLACEHOLDER}"
}

module "${APP_ENV}_project" {
  source          = "../../modules/project"
  project_name    = "${APP_NAME}-${ENV}"
  project_id      = var.project_id
  folder_id       = module.${APP_ENV}_folder.folder_id
  billing_account = var.billing_account
  org_id          = var.org_id
}

module "org_policy_sa_creation" {
  source     = "../../modules/org_policy"
  org_id     = var.org_id
  constraint = "constraints/iam.disableServiceAccountCreation"
  parent     = module.${APP_ENV}_folder.folder_id
  enforced   = false
}
