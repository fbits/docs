workflow "Documentation Generation Workflow" {
  on = "push"
  resolves = ["DocFX - Build and publish documentation"]
}

action "DocFX - Generate TypeScript Documentation" {
  uses = "./actions/tsdocgen"
  secrets = [
    "GITHUB_TOKEN",
    "GH_USER",
    "GH_EMAIL",
  ]
  env = {
    TARGET_SOURCE_PATH = "typings/lib"
  }
}

action "DocFX - Build and publish documentation" {
  uses = "./actions/docprep"
  needs = ["DocFX - Generate TypeScript Documentation"]
  secrets = [
    "GITHUB_TOKEN"
  ]
}
