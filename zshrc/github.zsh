#　未レビューのPRをすべて取得
fetchReviewAssignedPRs () {
    # export GITHUB_REVIEW_TARGET_REPOS=("user/repo" "user/repo")
    results=()
    for r in ${GITHUB_REVIEW_TARGET_REPOS} 
    do
      result=$(gh pr list --search "review-requested:@me repo:${r}" --json number,title,updatedAt --template '{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt)}}{{end}}')
      if [[ -n "${result}" ]]; then
        results+=("\n\n[${r}]\n")
        results+=("$result")
      fi
    done

    if [[ ${#results[@]} -eq 0 ]]; then
        results+=("\nNo PR is ready to be reviewd.\n")
    fi

    echo "${results[@]}"
}
