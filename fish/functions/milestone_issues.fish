# Usage: milestone_issues <milestone-title>
function milestone_issues
  set milestone $argv[1]

  gh issue list --milestone $milestone
end
