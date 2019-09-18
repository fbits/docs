workflow "Documentation Generation Workflow" {
  on = "push"
  resolves = ["DocFX - Build and publish documentation"]
}

action "DocFX - Build and publish documentation" {
  uses = "./actions/docprep"
  needs = ["DocFX - Generate TypeScript Documentation"]
  secrets = [
    "GITHUB_TOKEN"
  ]
}
