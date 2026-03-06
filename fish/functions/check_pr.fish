# Usage: check_pr <pr-number>
function check_pr
  set pr_number $argv[1]

  gh pr checks $pr_number
end
