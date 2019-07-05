class Account < ApplicationRecord
	belongs_to :user

	def newbalance
		'hello world'
	end
end
