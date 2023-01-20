# give me random stuff

# pets
resource "random_pet" "team" {
  count = var.team_count
}

resource "random_pet" "project" {
  count = var.project_count
}

resource "random_pet" "workspace" {
  count = var.workspace_count
}

resource "random_pet" "tag" {
  count = var.tag_count
}

resource "random_shuffle" "tag_names" {
  # need one result for each workspace
  count        = var.workspace_count
  input        = [for tag in random_pet.tag : tag.id]
  result_count = 3
}

resource "random_shuffle" "workspace_project" {
  # need one resource for each workspace
  count = var.workspace_count
  input = [for project in tfe_project.this : project.id]
}

## TEAM_WORKSPACE
resource "random_shuffle" "team_access_access" {
  count = var.team_access_count
  input = ["read", "plan", "write", "admin"]
}

resource "random_shuffle" "team_access_team" {
  count = var.team_access_count
  input = [for team in tfe_team.this : team.id]
}

resource "random_shuffle" "team_access_workspace" {
  count = var.team_access_count
  input = [for workspace in tfe_workspace.this : workspace.id]
}

## TEAM_PROJECT
resource "random_shuffle" "team_project_access_access" {
  count = var.team_project_access_count
  input = ["read", "admin"]
}

resource "random_shuffle" "team_project_access_team" {
  count = var.team_project_access_count
  input = [for team in tfe_team.this : team.id]
}

resource "random_shuffle" "team_project_access_project" {
  count = var.team_project_access_count
  input = [for project in tfe_project.this : project.id]
}
