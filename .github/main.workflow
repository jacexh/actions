workflow "build" {
  on = "push"
  resolves = ["actions/docker/cli@maste-1"]
}

action "actions/docker/login@master" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
}

action "actions/docker/cli@maste" {
  uses = "actions/docker/cli@maste"
  needs = ["actions/docker/login@master"]
  args = "build -t jacexh/hugo-action:0.53"
}

action "actions/docker/cli@maste-1" {
  uses = "actions/docker/cli@maste"
  needs = ["actions/docker/cli@maste"]
  args = "push jace/hugo-action:0.53"
}
