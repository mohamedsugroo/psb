json.sentrequests @pen do |pen|
  json.(pen, :id, :from_user_id, :to_user_id, :amount, :aproved, :declined, :seen, :expdate, :timestamp)
end