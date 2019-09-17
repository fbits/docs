workflow "Documentation Generation Workflow" {
  on = "push"
  resolves = ["DocFX - Generate TypeScript Documentation"]
}

action "DocFX - Generate TypeScript Documentation" {
  uses = "./actions/tsdocgen"
  secrets = [
    "GITHUB_TOKEN",
  ]
  env = {
    TARGET_PACKAGE = "@azure/cosmos"
    TARGET_SOURCE_PATH = "src"
  }
}
