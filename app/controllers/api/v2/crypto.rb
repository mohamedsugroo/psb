module Api::V2::Crypto
	
	SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
	
	def self.encrypt(payload, exp = Time.now + 24.hours)
	    payload[:exp] = exp.to_i
	    token = JWT.encode(payload, SECRET_KEY)
		return token
	end

	def self.decrypt(token)
		decoded = JWT.decode(token, SECRET_KEY)[0]
		return HashWithIndifferentAccess.new decoded
	end
	
end