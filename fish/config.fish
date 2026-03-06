# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/jonlegasa/anaconda3/bin/conda
    eval /Users/jonlegasa/anaconda3/bin/conda "shell.fish" hook $argv | source
end
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
set -gx PATH $PATH /usr/local/bin /opt/homebrew/bin

# <<< conda initialize <<<
# Golang configurations
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

neofetch --source ~/.config/neofetch/archimedes.txt
tmux -f ~/.config/tmux/tmux.conf
set -gx PATH "$HOME/.local/bin" $PATH

# Project configurations
set -gx PROJECT_ONE_PATH "$HOME/code/demeter"
set -gx PROJECT_ONE_CMD "echo 'Ready to work'"
set -gx PROJECT_ONE_MSG "Demeter project loaded"

set -gx PROJECT_TWO_PATH "$HOME/code/blaise"
set -gx PROJECT_TWO_CMD "echo 'Ready to work'"
set -gx PROJECT_TWO_MSG "Blaise project loaded"

atuin init fish | source

# ─────────────────────────────────────────
# ISSUES
# ─────────────────────────────────────────

# Create an issue and add it to the project board
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
  echo "Added to project #$project_number"
end

# Assign an issue to a milestone
# Usage: assign_milestone <issue-number> <milestone-title>
function assign_milestone
  set issue_number $argv[1]
  set milestone $argv[2]

  gh issue edit $issue_number --milestone $milestone
  echo "Issue #$issue_number assigned to milestone: $milestone"
end

# Close an issue
# Usage: close_issue <issue-number>
function close_issue
  set issue_number $argv[1]

  gh issue close $issue_number
  echo "Issue #$issue_number closed"
end

# List all open issues
# Usage: list_issues
function list_issues
  gh issue list
end


# ─────────────────────────────────────────
# MILESTONES
# ─────────────────────────────────────────

# Create a milestone
# Usage: create_milestone <org> <repo> <title> <due-date: YYYY-MM-DD>
function create_milestone
  set org $argv[1]
  set repo $argv[2]
  set title $argv[3]
  set due_date $argv[4]

  gh api repos/$org/$repo/milestones \
    -f title=$title \
    -f due_on={$due_date}T00:00:00Z

  echo "Milestone '$title' created with due date $due_date"
end

# List all milestones in a repo
# Usage: list_milestones <org> <repo>
function list_milestones
  set org $argv[1]
  set repo $argv[2]

  gh api repos/$org/$repo/milestones --jq '.[].title'
end

# List all issues under a milestone
# Usage: milestone_issues <milestone-title>
function milestone_issues
  set milestone $argv[1]

  gh issue list --milestone $milestone
end


# ─────────────────────────────────────────
# PULL REQUESTS
# ─────────────────────────────────────────

# Create a PR that closes an issue
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

# Check CI status on a PR
# Usage: check_pr <pr-number>
function check_pr
  set pr_number $argv[1]

  gh pr checks $pr_number
end

# Approve a PR
# Usage: approve_pr <pr-number>
function approve_pr
  set pr_number $argv[1]

  gh pr review $pr_number --approve
  echo "PR #$pr_number approved"
end

# Request changes on a PR
# Usage: request_changes <pr-number> <comment>
function request_changes
  set pr_number $argv[1]
  set comment $argv[2]

  gh pr review $pr_number --request-changes --body $comment
end

# Merge a PR
# Usage: merge_pr <pr-number>
function merge_pr
  set pr_number $argv[1]

  gh pr merge $pr_number
  echo "PR #$pr_number merged"
end

# List all open PRs
# Usage: list_prs
function list_prs
  gh pr list
end
