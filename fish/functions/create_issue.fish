#!/usr/bin/env fish

# Usage: create_issue <project-number> <org> <title> <body>
function create_issue
  set project_number $argv[1]
  set org $argv[2]
  set title $argv[3]
  set body $argv[4]

  set issue_url (gh issue create --title $title --body $body 2>&1 | tail -1)

  if test $status -ne 0
    echo "Error: failed to create issue"
    return 1
  end

  echo "Created issue: $issue_url"

  gh project item-add $project_number --owner $org --url $issue_url

  if test $status -ne 0
    echo "Error: failed to add issue to project"
    return 1
  end

  echo "Added to project #$project_number"
end
