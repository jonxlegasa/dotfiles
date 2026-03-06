# Usage: merge_pr <pr-number>
function merge_pr
  set pr_number $argv[1]

  gh pr merge $pr_number
  echo "PR #$pr_number merged"
end
