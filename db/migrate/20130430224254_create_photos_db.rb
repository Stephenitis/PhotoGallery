class CreatePhotosDb < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filepath
      t.timestamps
    end
  end
end
