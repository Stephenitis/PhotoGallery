class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :text
      t.string :photo
      t.references :user
      t.timestamps
    end
  end
end
