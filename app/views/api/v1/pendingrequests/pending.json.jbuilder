# json.array! @pen do |pen|
# 	json.id pen.id
# 	json.from_user_id  pen.from_user_id
# 	json.to_user_id  pen.to_user_id
# 	json.amount  pen.amount
# 	json.aproved  pen.aproved
# 	json.declined  pen.declined
# 	json.seen  pen.seen
# 	json.expdate pen.expdate
# 	json.timestamp pen.timestamp
# end


json.pendingrequests @pen do |pen|
  json.(pen, :id, :from_user_id, :to_user_id, :amount, :aproved, :declined, :seen, :expdate, :timestamp)
end