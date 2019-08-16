json.array! @users do |user|
    # next if comment.marked_as_spam_by?(current_user)
    json.profile user.profile
end