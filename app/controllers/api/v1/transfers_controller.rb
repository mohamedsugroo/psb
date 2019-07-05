module Api
	module V1
		class TransfersController < ApplicationController
			before_action :authorize_request

			def index
				from = authorize_request
				to = params[:to]
				amount = params[:amount]

				if (params.has_key?(:to) && params.has_key?(:amount))
					if (!amount.nil? && !to.nil?)
						if from.balance.to_i > amount.to_i
							render json: {
								balance: from.balance.to_i,
								amount: amount.to_i,
								newBalance: from.balance.to_i + amount.to_i
							}
						else
							insufficient_funds
						end
					else
						error_statement
					end
					
				else
					error_statement	
				end
				
			end

			def history
				firstblock = Block.where(to: authorize_request.username) + Block.where(from: authorize_request.username)
				render json: firstblock.sort_by { |k| k["created_at"] }.reverse
			end

			def payment_request
				render json: {
					stats: :ok
				}
			end

			def sendto
				user_id = authorize_request.id
				to_user = set_user(params[:to])
				amount = params[:amount].to_i
				newbalance = authorize_request.balance.to_i - amount
				Blockchain::Transaction.updatebalance(authorize_request.username,to_user.username,amount)

				render json: {
					state: :ok,
					amount: amount,
					user: user_id,
					to: {
						id: to_user.id,
						balance: to_user.balance.to_i
					},
					balance: authorize_request.balance.to_i,
					newbalance: newbalance,
					bloks: Block.all
				}
			end


			def set_user(username)
				Blockchain::Transaction.find_by_username(username)
			end

			private

			def error_statement
				render json: { error: 'Please make sure you pass in all the params' }
			end

			def insufficient_funds
				render json: { error: 'Insufficient Funds' }
			end

		end
	end
end
