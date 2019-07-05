module Blockchain
	class Newblock < ApplicationController
		def initialize(from,to,amount)
			@hash = cal_hash
			@previous_hash = ''
			@timestamp = Time.now
			@from = from
			@to = to
			@amount = amount
		end

		def getlast_block
			block = Block.order("created_at DESC").first
			return block.current_hash
		end

		def create
			Block.create(
				current_hash: cal_hash,
				previous_hash: getlast_block,
				timestamp: @timestamp.to_s,
				from: @from,
				to: @to,
				amount: @amount
			)
		end

		def cal_hash
			sha = Digest::SHA256.new
			sha.update( @timestamp.to_s + @previous_hash.to_s + @from.to_s + @to.to_s + @amount.to_s )
			sha.hexdigest
		end

		def cost
			# get the transaction fee % from the data dumb file
			fee = 0.02
			# subtract the fee from this transaction
			
		end

	end

end