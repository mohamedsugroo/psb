class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :access_token
      t.integer :user_id
      t.string :uidn
      t.string :app_type
      t.boolean :approved
      t.boolean :pending_approval
      t.boolean :active
      t.boolean :suspended
      t.boolean :soft_delete

      t.timestamps
    end
  end
end
