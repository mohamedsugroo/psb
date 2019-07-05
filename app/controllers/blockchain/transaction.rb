class Blockchain::Transaction

	def self.find_by_email(email)
		user = User.where(email: email).first
		return user
	end

	def self.find_by_username(username)
		user = User.where(username: username).first
		return user
	end

	def self.updatebalance(from,to,amount)
		add(to,amount)
		subtract(from,amount)
		block = Blockchain::Newblock.new(from,to,amount)
		block.create
	end

	def self.add(user,amount)
		new_amount = amount
		user =  User.where(username: user).first
		balance = user.balance.to_i + amount
		user.update(balance: balance)
		return balance
	end

	def self.subtract(user,amount)
		user =  User.where(username: user).first
		balance = user.balance.to_i - amount
		user.update(balance: balance)
		return balance
	end

	def self.check_funds(id)
		true
	end

	def mineBlock(data)
		calculatecost()
		updatebalance(from,to,amount)
	end

	def self.calculatecost(amount)
		# get the transaction fee % from the data dumb file
		fee = 0.02
		awarded_to = 1
		# subtract the fee from this transaction
		transaction_fee = @amount * fee
		awarded_amount = @amount - transaction_fee
		tax = {
			fee: fee,
			awarded_to: awarded_to,
			awarded_amount: awarded_amount,
			transaction_fee: transaction_fee
		}
		return tax

	end

end



	# Transaction.find_by_email('Marco')
	# Transaction.find_by_username('Marco')
	# Transaction.updatebalance(16)

	# block = Block.new('Marco','Lina',3000)
	# puts block.cal_hash
	# puts block.new_block
