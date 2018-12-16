workflow "git-pr-release flow" {
  resolves = [
    "git-pr-release!",
    "debug",
  ]
  on = "issues"
}

action "new_issue?" {
  uses = "actions/bin/filter@master"
  args = ["action", "opened"]
}

action "use_git-pr-release?" {
  uses = "actions/bin/filter@master"
  args = ["label", "git-pr-release"]
}

action "git-pr-release!" {
  uses    = "docker://circleci/ruby:2.5.3-node"
  needs   = ["new_issue?", "use_git-pr-release?"]
  secrets = ["GIT_PR_RELEASE_TOKEN"]
  args    = [".github/bin/git-pr-release"]
}

action "debug" {
  uses = "actions/bin/debug@master"
}
