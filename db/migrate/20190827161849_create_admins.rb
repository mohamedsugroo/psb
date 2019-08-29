class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :role_type
      t.string :password_digest
      t.string :pin_code

      t.timestamps
    end
  end
end
