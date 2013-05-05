class CreatePhotosDb < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filepath
      t.references :album
      t.timestamps
    end
  end
end
