class Role < ApplicationRecord
	has_many :users

	# Roles are used to define the account type for example 
	# Acreditor, merchant or consumer account
end
