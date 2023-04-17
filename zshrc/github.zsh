#　未レビューのPRをすべて取得
fetchReviewAssignedPRs () {
    # export GITHUB_REVIEW_TARGET_REPOS=("user/repo" "user/repo")
    is_hit=false
    for r in ${GITHUB_REVIEW_TARGET_REPOS} 
    do
      result=$(gh pr list --search "review-requested:@me repo:${r}" --json number,title,updatedAt --template '{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title (timeago .updatedAt)}}{{end}}')
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
