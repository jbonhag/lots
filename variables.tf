variable "oauth_token" {
  type = string
}

variable "organization" {
  type = string
}

variable "team_count" {
  description = "how many teams"
  type        = number
  default     = 10
}

variable "workspace_count" {
  description = "how many workspaces"
  type        = number
  default     = 10
}

variable "tag_count" {
  description = "how many tags"
  type        = number
  default     = 10
}

variable "project_count" {
  description = "how many projects"
  type        = number
  default     = 5
}

variable "team_access_count" {
  description = "how many team workspaces"
  type        = number
  default     = 10
}

variable "team_project_access_count" {
  description = "how many team projects"
  type        = number
  default     = 10
}
