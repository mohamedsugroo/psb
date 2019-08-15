module Api
	module V1
		class PendingrequestsController < ApplicationController
			before_action :current_user

			def index
				requests = Pendingtransaction.where(to_user_id: current_user.id )
				newreq = []

				requests.each do |req|
					user = User.where(id: req.from_user_id).first
					newreq.push({
						id: req.id,
						amount: req.amount,
						approved: req.aproved,
						exp_date: req.expdate,
						declined: req.declined,
						seen: req.seen,
						timestamp: req.timestamp,
						user: user
					})
					@requests = newreq
					render 'Hello'
				end
				# {
					# "id": 1,
					# "from_user_id": 2,
					# "to_user_id": 1,
					# "amount": "20",
					# "aproved": null,
					# "declined": null,
					# "seen": false,
					# "expdate": "1559128853",
					# "timestamp": "1558696853"
				# },
				# render json: @requests
			end

			def finduserbyid
				user = User.where(id: params[:id].to_i).first
				render json: {
					user_name: user.username,
					email: user.email
				}
			end

			def approve
				pen = Pendingtransaction.find_by(id: params[:id])
				if current_user.id == pen.to_user_id
					pen.update(aproved: true, declined: false)
					render json: pen
				end
			end

			def decline
				pen = Pendingtransaction.find_by(id: params[:id])
				if current_user.id == pen.to_user_id
					pen.update(aproved: false, declined: true)
					render json: pen
				end
			end

			def pending
				user = current_user.id
				requests = Pendingtransaction.where(to_user_id: current_user.id, aproved: false)
				requests_history = Pendingtransaction.where(to_user_id: current_user.id)
				newreq = []
				history = []

				requests.each do |req|
					user = User.where(id: req.from_user_id).first
					newreq.push({
						id: req.id,
						amount: req.amount,
						approved: req.aproved,
						exp_date: req.expdate,
						declined: req.declined,
						seen: req.seen,
						timestamp: req.timestamp,
						user: {
							username: user.username,
							fullname: "#{user.first_name} #{user.middle_name} #{user.last_name}"
						}
					})
				end

				requests_history.each do |req|
					user = User.where(id: req.from_user_id).first
					history.push({
						id: req.id,
						amount: req.amount,
						approved: req.aproved,
						exp_date: req.expdate,
						declined: req.declined,
						seen: req.seen,
						timestamp: req.timestamp,
						user: {
							username: user.username,
							fullname: "#{user.first_name} #{user.middle_name} #{user.last_name}"
						}
					})
				end
				render json: {
					pending: newreq,
					history: history
				}
			end

			def sent
				user = current_user.id
				@pen = Pendingtransaction.where(from_user_id: user)
				# render json: pen
			end

			def moneyspent
				user = current_user.username
				blocks = Block.where(from: user)
				render json: blocks

			end

			def moneyincome
				user = current_user.username
				blocks = Block.where(to: user)
				render json: blocks
			end

		end
	end
end