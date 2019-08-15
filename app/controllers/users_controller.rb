class UsersController < ApiController
  before_action :current_user, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users.each { |u| u.profile}, status: :ok
  end

  # GET /users/{username}
  def show
    accounts = Account.where(user_id: @user.id)
    friends = @user.friends
    spentIt = []
    incoming = []
    payeesList = []

    friends.each do |f|
      user = User.where(id: f.friend_id).first
      payeesList.push({
        fullname: "#{user.first_name} #{user.middle_name} #{user.last_name}",
        email:  user.email,
        username:  user.username,
        avatar: user.avatar.url(:original)
      })
    end


    spent = Block.where(from: @user.username).order("created_at DESC")
    income = Block.where(to: @user.username).order("created_at DESC")

    spentamount = 0
    
    spent.each do |data|
      spentamount = spentamount + data.amount
      user = User.where(username: data.to).first
      spentIt.push({
        id: data.id,
        current_hash:  data.current_hash,
        previous_hash:  data.previous_hash,
        timestamp:  data.timestamp,
        user: {
          fullname: "#{user.first_name} #{user.middle_name} #{user.last_name}",
          email:  user.email,
          username:  user.username,
        },
        amount:  data.amount, 
        created_at:  data.created_at.to_formatted_s(:short),
        updated_at: data.updated_at,
        color: 'red'
      })
    end


    incomeamount = 0
    income.each do |data|
      incomeamount = incomeamount + data.amount
      user = User.where(username: data.from).first
      incoming.push({
        id: data.id,
        current_hash:  data.current_hash,
        previous_hash:  data.previous_hash,
        timestamp:  data.timestamp,
        user: {
          fullname: "#{user.first_name} #{user.middle_name} #{user.last_name}",
          email:  user.email,
          username:  user.username,
        },
        amount:  data.amount, 
        created_at:  data.created_at.to_formatted_s(:short),
        updated_at: data.updated_at,
        color: 'green'
      })
    end 
    # database.sort_by{|e| e[:id]}
    # database.sort_by { |timestamp| timestamp.count }.reverse
    
    render json: {
      user: {
        id: @user.id,
        username: @user.username,
        email: @user.email,
        first_name: @user.first_name.to_s,
        middle_name: @user.middle_name.to_s,
        last_name: @user.last_name.to_s,
        date_of_with: @user.date_of_with,
        pirth_place: @user.pirth_place,
        primary_phone_number: @user.primary_phone_number,
        secondary_phone_number: @user.secondary_phone_number,
        balance: @user.balance,
        approved: @user.approved,
        approved_by: @user.approved_by,
        personal_account: @user.personal_account,
        business_account: @user.business_account,
        date_approved: @user.date_approved,
        avatar: url_for(@user.avatar.url(:original))

      },
      accounts: accounts,
      spend: spentIt,
      income: incoming,
      spentamount: spentamount,
      incomeamount: incomeamount,
      payees: payeesList,
      status: :ok
    }
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
    	:username, :email, :password, :password_confirmation, :first_name, :middle_name, :date_of_with, :pirth_place, :primary_phone_number, :secondary_phone_number, avatar: {}
    )
  end
end