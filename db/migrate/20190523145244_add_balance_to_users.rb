class AddBalanceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :balance, :string
    add_column :users, :approved, :boolean
    add_column :users, :approved_by, :integer
    add_column :users, :personal_account, :boolean
    add_column :users, :business_account, :boolean
    add_column :users, :date_approved, :string
  end
end
