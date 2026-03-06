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
