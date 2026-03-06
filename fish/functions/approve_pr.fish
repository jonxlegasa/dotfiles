# Usage: approve_pr <pr-number>
function approve_pr
  set pr_number $argv[1]

  gh pr review $pr_number --approve
  echo "PR #$pr_number approved"
end
