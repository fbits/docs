workflow "Documentation Generation Workflow" {
  on = "push"
  resolves = ["DocFX - Generate TypeScript Documentation"]
}

action "DocFX - Generate TypeScript Documentation" {
  uses = "./actions/tsdocgen"
  secrets = [
    "GITHUB_TOKEN",
    "GH_EMAIL",
    "GH_USER",
  ]
  env = {
    TARGET_PACKAGE = "@azure/cosmos"
    TARGET_SOURCE_PATH = "src"
  }
}
