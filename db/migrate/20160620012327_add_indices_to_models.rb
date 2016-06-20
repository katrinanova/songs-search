class AddIndicesToModels < ActiveRecord::Migration
  def change

    add_index :artists, :name, unique: true
    add_index :albums, :title, unique: true
    add_index :songs, :title, unique: true
  end
end
