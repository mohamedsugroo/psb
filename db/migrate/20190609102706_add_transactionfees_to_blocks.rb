class AddTransactionfeesToBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :blocks, :cost, :string
    add_column :blocks, :tax, :string
  end
end
