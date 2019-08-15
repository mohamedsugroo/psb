class CreatePayees < ActiveRecord::Migration[6.0]
  def change
    create_table :payees do |t|
      t.integer :user_id
      t.integer :payee_id
      t.json :info, null: false, default: '{}'

      t.timestamps
    end
    add_index :payees, :payee_id, unique: true
  end
end
