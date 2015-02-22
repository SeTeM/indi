class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :login,            null: false
      t.string :email,            null: false
      t.string :about
      t.date :hired_at
      t.string :api_token

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :login, unique: true
    add_index :users, :api_token, unique: true
  end
end
