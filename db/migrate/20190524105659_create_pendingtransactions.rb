class CreatePendingtransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :pendingtransactions do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :amount
      t.boolean :aproved
      t.boolean :declined
      t.string :expdate
      t.string :timestamp
      t.boolean :seen

      t.timestamps
    end
  end
end
