class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.string :current_hash
      t.string :previous_hash
      t.string :timestamp
      t.string :from
      t.string :to
      t.integer :amount

      t.timestamps
    end
  end
end
