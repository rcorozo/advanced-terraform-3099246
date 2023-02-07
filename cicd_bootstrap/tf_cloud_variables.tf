resource "tfe_variable" "dev_project_id" {
    key = "project-id"
    value = var.dev-project-id
    category = "terraform"
    workspace_id = tfe_workspace.dev.id
    description = "DEV GCP ProjectID"
}

resource "tfe_variable" "qa_project_id" {
    key = "project-id"
    value = var.qa-project-id
    category = "terraform"
    workspace_id = tfe_workspace.qa.id
    description = "QA GCP ProjectID"
}

resource "tfe_variable" "dev_region" {
    key = "region"
    value = var.region
    category = "terraform"
    workspace_id = tfe_workspace.dev.id
    description = "GCP Region"
}

resource "tfe_variable" "qa_region" {
    key = "region"
    value = var.region
    category = "terraform"
    workspace_id = tfe_workspace.qa.id
    description = "GCP Region"
}

resource "tfe_variable" "dev_zone" {
    key = "zone"
    value = var.zone
    category = "terraform"
    workspace_id = tfe_workspace.dev.id
    description = "GCP Zone"
}

resource "tfe_variable" "qa_zone" {
    key = "zone"
    value = var.zone
    category = "terraform"
    workspace_id = tfe_workspace.qa.id
    description = "GCP Zone"
}

resource "tfe_variable" "dev_instance_service_account" {
    key = "instance_service_account"
    value = var.dev-instance_service_account
    category = "terraform"
    workspace_id = tfe_workspace.dev.id
}

resource "tfe_variable" "qa_instance_service_account" {
    key = "instance_service_account"
    value = var.qa-instance_service_account
    category = "terraform"
    workspace_id = tfe_workspace.qa.id
}

resource "tfe_variable" "dev_target_environment" {
    key = "target_environment"
    value = "DEV"
    category = "terraform"
    workspace_id = tfe_workspace.dev.id
    description = "DEV Target Environment"
}

resource "tfe_variable" "qa_target_environment" {
    key = "target_environment"
    value = "QA"
    category = "terraform"
    workspace_id = tfe_workspace.qa.id
    description = "QA Target Environment"
}

resource "tfe_variable" "dev_google_credentials" {
    key = "GOOGLE_CREDENTIALS"
    value = replace(module.service_account_dev.key, "/\\n/","")
    category = "env"
    workspace_id = tfe_workspace.dev.id
    sensitive = true
    description = "DEV Project Credentials"
}

resource "tfe_variable" "qa_google_credentials" {
    key = "GOOGLE_CREDENTIALS"
    value = replace(module.service_account_qa.key, "/\\n/", "")
    category = "env"
    workspace_id = tfe_workspace.qa.id
    sensitive = true
    description = "QA Project Credentials"
}