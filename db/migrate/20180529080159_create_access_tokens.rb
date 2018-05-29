class CreateAccessTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :access_tokens do |t|
      t.integer :user_id
      t.string :token
      t.string :ip
      t.string :device
      t.string :device_id
      t.string :browser
      t.datetime :deleted_at
      t.datetime :last_active_at
      t.timestamps
    end
  end
end
