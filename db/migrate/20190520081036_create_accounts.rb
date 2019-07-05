class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.boolean :approved
      t.integer :approved_by
      t.boolean :personal_account
      t.boolean :business_account
      t.string :balance
      t.string :date_approved

      t.timestamps
    end
  end
end
