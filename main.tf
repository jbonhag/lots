# resources
resource "tfe_team" "this" {
  count        = var.team_count
  organization = var.organization
  name         = random_pet.team[count.index].id
}

resource "tfe_workspace" "this" {
  count        = var.workspace_count
  organization = var.organization
  name         = random_pet.workspace[count.index].id

  # assign a random project
  project_id = random_shuffle.workspace_project[count.index].result[0]

  # assign random tags
  tag_names = random_shuffle.tag_names[count.index].result

  vcs_repo {
    identifier     = "jbonhag/terraform-workspace-simple"
    oauth_token_id = tfe_oauth_client.this.oauth_token_id
  }

  auto_apply   = true
  force_delete = true
}

resource "tfe_project" "this" {
  count        = var.project_count
  organization = var.organization
  name         = random_pet.project[count.index].id
}

resource "tfe_team_access" "this" {
  count        = var.team_access_count
  access       = random_shuffle.team_access_access[count.index].result[0]
  team_id      = random_shuffle.team_access_team[count.index].result[0]
  workspace_id = random_shuffle.team_access_workspace[count.index].result[0]
}

resource "tfe_team_project_access" "this" {
  count      = var.team_project_access_count
  access     = random_shuffle.team_project_access_access[count.index].result[0]
  team_id    = random_shuffle.team_project_access_team[count.index].result[0]
  project_id = random_shuffle.team_project_access_project[count.index].result[0]
}

resource "tfe_oauth_client" "this" {
  name             = "jbonhag"
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth_token
  service_provider = "github"
}
