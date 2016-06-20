class AddIndicesToModels < ActiveRecord::Migration
  def change

    add_index :artists, :name
    add_index :albums, :title
    add_index :songs, :title
  end
end
