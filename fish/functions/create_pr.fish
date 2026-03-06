# Usage: create_pr <title> <issue-number> <reviewer>
function create_pr
  set title $argv[1]
  set issue_number $argv[2]
  set reviewer $argv[3]

  gh pr create \
    --title $title \
    --body "Closes #$issue_number" \
    --base main \
    --reviewer $reviewer
end
