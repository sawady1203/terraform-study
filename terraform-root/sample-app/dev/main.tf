provider "google" {
  project = var.bootstrap_project
  region  = "asia-northeast1"
}

module "sample-app_dev_folder" {
  source      = "../../modules/folder"
  folder_name = "sample-app-dev"
  parent      = "organizations/${var.org_id}"
}

module "sample-app_dev_project" {
  source          = "../../modules/project"
  project_name    = "sample-app-dev"
  project_id      = var.project_id
  folder_id       = module.sample-app_dev_folder.folder_id
  billing_account = var.billing_account
  org_id          = var.org_id
}

module "org_policy_sa_creation" {
  source     = "../../modules/org_policy"
  org_id     = var.org_id
  constraint = "constraints/iam.disableServiceAccountCreation"
  parent     = module.sample-app_dev_folder.folder_id
  enforced   = false
}
