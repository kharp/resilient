class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category
      t.references :pin, index: true

      t.timestamps
    end
  end
end
