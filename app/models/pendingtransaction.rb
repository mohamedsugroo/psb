class Pendingtransaction < ApplicationRecord

	before_create :setup


	def setup
		slef.aproved = false
		self.declined = false
	end

end
