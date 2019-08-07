module Api::V2::Auth
	class ChangePassword
		def self.match_answer(x, y)
			x = x.delete(' ').downcase 
			y = y.delete(' ').downcase 
			x == y
			return {x:x, y:y}
		end
	end
end