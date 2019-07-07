class HomeController < ApplicationController
	before_action :authorize_request, except: [:index]
  def index
  	# b = Blockchain::Newblock.new('demo','msugroo',0)
  	# b.create
  	# user = Blockchain::Transaction.find_by_username('msugroo')
  	# render json: {
  	# 	transaction: {
  	# 		username: user.username
  	# 	},
  	# 	blocks: Block.all
  	# }
  end
end
