class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :date_of_with
      t.string :pirth_place
      t.string :primary_phone_number
      t.string :secondary_phone_number

      t.timestamps
    end
  end
end
