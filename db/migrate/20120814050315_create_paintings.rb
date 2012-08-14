class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.integer :gallery_id
      t.string :name
      t.references :gallery

      t.timestamps
    end
    add_index :paintings, :gallery_id
  end
end
