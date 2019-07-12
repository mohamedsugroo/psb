class Block < ApplicationRecord

    before_create :cal_hash


    def cal_hash
        sha = Digest::SHA256.new
        sha.update(
			(self.previous_hash + self.timestamp + self.from + self.to +self.amount).to_s
        )
        self.previous_hash = sha.hexdigest
    end
end
