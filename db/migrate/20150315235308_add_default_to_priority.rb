class AddDefaultToPriority < ActiveRecord::Migration
  def change
    change_column :resources, :priority, :integer, default: 0
  end
end
