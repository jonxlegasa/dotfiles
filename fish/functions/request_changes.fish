# Usage: request_changes <pr-number> <comment>
function request_changes
  set pr_number $argv[1]
  set comment $argv[2]

  gh pr review $pr_number --request-changes --body $comment
end
