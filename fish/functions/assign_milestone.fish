# Usage: assign_milestone <issue-number> <milestone-title>
function assign_milestone
  set issue_number $argv[1]
  set milestone $argv[2]

  gh issue edit $issue_number --milestone $milestone
  echo "Issue #$issue_number assigned to milestone: $milestone"
end
