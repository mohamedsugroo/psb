namespace :validator do
	desc "Block Validator"
	task :block => :environment do

		class ChainValidation

			def self.check

				# Block.delete_all

				puts "Staring validation . . ."

				b = Block.all

				blocks = b.length

				passed = []
				failed = []


                b.each_cons(2) do  |a,b| 
					num =  passed.size + failed.size
					set_pres(num,blocks)
					if a.current_hash == b.previous_hash
						passed.push({
							a: a.id,
							b: b.id
						})
					else
						failed.push({
							a: {
								id: a.id,
								hash: a.current_hash,
								prev: a.previous_hash
							},
							b: {
								id: b.id,
								hash: b.current_hash,
								prev: b.previous_hash
							}
						})
					end

					failed.each do |a|
						puts Block.where(current_hash: a[:current_hash])
					end
				end

				puts ". . . validation Completed - Passed: #{passed.size} - Failed: #{failed.size}"
				p "Failed Checks"
				sleep(1.0/24.0)
				puts JSON.pretty_generate(failed)

			end

			private 
				def self.set_pres(number,max)
					x = (number * 100) / max
					sleep(0.010/24.0)
					puts "#{x} %"
				end

		end

		ChainValidation.check

	end	
end
