class CreateLocalUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'
    create_table :local_users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :auth0_id
      t.datetime :last_seen
      t.timestamps
    end

    add_index :local_users, :auth0_id, unique: true
  end
end
