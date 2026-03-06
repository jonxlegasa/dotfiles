# Usage: close_issue <issue-number>
function close_issue
  set issue_number $argv[1]

  gh issue close $issue_number
  echo "Issue #$issue_number closed"
end
