class CreateProvider < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.integer :user_id
      t.string :name
      t.string :uid
      t.text :raw
    end
  end
end
