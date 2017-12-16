class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.integer :count 
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
