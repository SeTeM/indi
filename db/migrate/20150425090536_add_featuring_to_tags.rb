class AddFeaturingToTags < ActiveRecord::Migration
  def change
    add_column :tags, :featuring, :boolean, default: false

    add_index :tags, :title, unique: true
  end
end
