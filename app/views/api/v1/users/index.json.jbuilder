json.users @users do |user|
  json.(user, :id, :username)
end