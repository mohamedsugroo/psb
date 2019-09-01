module Transaction
	def self.start(data)
		role('')
	end

	def role(role)
		'Accreditor,Merchant or consumer'
		# once the account role is retrived start Transaction
		validate('')
	end

	def validate(account)
		# validate the account balance if greater than the transaction amount
		# if validation passed
		# start created the block
		# else 
		# send message back msg 'you dont have enough funds to make this transactio please add funds'
	end

end