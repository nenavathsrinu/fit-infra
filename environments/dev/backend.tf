# This bootstrap environment uses local state initially.
# After the state bucket and lock table exist, migrate this stack manually.
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
