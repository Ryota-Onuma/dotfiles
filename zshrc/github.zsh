#　未レビューのPRをすべて取得
fetchReviewAssignedPRs () {
    # export GITHUB_REVIEW_TARGET_REPOS=("user/repo" "user/repo")
    is_hit=false
    for r in ${GITHUB_REVIEW_TARGET_REPOS} 
    do
      result=$(gh pr list --repo "$r" --search "review-requested:@me" --json number,title,updatedAt --template '{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt)}}{{end}}')
      if [[ -n "${result}" ]]; then
        echo "\n[${r}]\n"
        echo "$result"
        echo "\n"
        is_hit=true
      fi
    done

    if [[ ${is_hit} == false ]]; then
        echo "\nNo PR is ready to be reviewd.\n"
    fi
}

review () {
  # export GITHUB_REVIEW_TARGET_REPOS=("user/repo" "user/repo")

  repo=$(printf "%s\n" "${GITHUB_REVIEW_TARGET_REPOS[@]}" | fzf --prompt="Please select repo: ")
  if [ -n "$repo" ]; then
    echo "$repo"
  else
    echo "No repo selected"
    break
  fi

  printf "Type the number of PR to review it: "
  read -r number
  gh pr view ${number} --repo ${repo} --web
}

createPR () {
  branch_name=$(git branch --show-current)
  pr_title=""
  extracted=""
  pattern="feature/(.*)"
  options=("Proceed without prefix","[NO-ISSUE]")

  if [[ $branch_name =~ $pattern ]]; then
    extracted=${match[1]}
    options+=extracted
  fi
  prefix=$(printf "%s\n" options | fzf --prompt="Please select PR prefix: ")
  if [ "$prefix" == "$extracted"]; then
    pr_title=$extracted
  fi

  printf "Type the title of PR: $pr_title"
  read -r title

  if [ -n "$title" ]; then
    pr_title=$title
  fi

  printf "Type the base branch of PR: "
  read -r base_branch

  if [ -z "$base_branch" ]; then
    base_branch="main"
  fi

  gh pr create -d -t "$pr_title" -base "$base_branch"
}

openPR () {
  printf "Type the number of PR to open it: "
  read -r number
  gh pr view ${number} --web
}   

