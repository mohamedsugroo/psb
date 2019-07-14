class App < ApplicationRecord

    before_create :gen_token

    def gen_token 
        randNumber = SecureRandom.hex(5)
        self.access_token = "#{self.created_at.to_i}.#{randNumber.upcase}.#{randNumber.upcase}.#{randNumber.upcase}"
        self.uidn = randNumber.upcase
    end
end
