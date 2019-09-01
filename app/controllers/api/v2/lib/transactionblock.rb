require 'digest'
class TransactionBlock

    def initialize(data, timestamp: nil, nonce: nil)
        @data = data
        @previous_hash = ''
        @timestamp = timestamp ? timestamp : Time.now.utc
        @hash = ''
        if nonce
			@nonce = nonce
			@hash  = calc_hash
		else
			@nonce, @hash = compute_hash_with_proof_of_work
		end
    end
    # a new block is requested
    def new
        # package the new block and return it to new block request
        calc_hash
    end
    # get the previuse transaction hash

    private
        # calculate the current transaction hash
        def calc_hash
            calc_hash_with_nonce( @nonce )
        end

        def compute_hash_with_proof_of_work( difficulty='00' )
			nonce = 0
			loop do
				hash = calc_hash_with_nonce( nonce )
				if hash.start_with?( difficulty )
					return [nonce,hash]    ## bingo! proof of work if hash starts with leading zeros (00)
				else
					nonce += 1             ## keep trying (and trying and trying)
				end
			end
        end

        def calc_hash_with_nonce( nonce=0 )
			sha = Digest::SHA256.new
			sha.update(
				nonce.to_s +
				@timestamp.to_s +
                @data.to_s +
                @previous_hash.to_s
            )
			sha.hexdigest
		end
end

data = {
    sender: {
        id: 1,
        username: 'msugroo',
        fullname: 'Mohamed Sugroo',
        current_balance: 309283,
        new_balance: 307283
    },
    recipient: {
        id: 2,
        username: 'danyD',
        fullname: 'Dany Davido',
        current_balance: 309283,
        new_balance: 307283
    },
    transaction: {
        amount: 2000,
        nonce: 234,
        ref: '823746328746'
    },
    device: {
        type: 'mobile'
    },
    location: {
        latitude: 8723643.74,
        longitude: 7637824.86
    }
}

# block = TransactionBlock.new(data, 'wenfinfiwnfwheuefwddwden')
# p block.new
