class CreateResourcePages < ActiveRecord::Migration
  def change
    create_table :resource_pages do |t|
      t.string :type
      t.string :title
      t.string :preview_image
      t.text :content
      t.integer :order
      t.string :slug

      t.timestamps
    end
    add_index :resource_pages, :slug, unique: true
  end
end
