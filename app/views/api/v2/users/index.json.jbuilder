json.array! @users do |user|
    # next if comment.marked_as_spam_by?(current_user)
    user.payees.each  do |payee|
        json.profile user.profile if payee.payee_id != user.id
    end
end