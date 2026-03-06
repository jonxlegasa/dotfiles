# Usage: list_milestones <org> <repo>
function list_milestones
  set org $argv[1]
  set repo $argv[2]

  gh api repos/$org/$repo/milestones --jq '.[].title'
end
