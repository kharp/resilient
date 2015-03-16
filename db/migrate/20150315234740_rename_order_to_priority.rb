class RenameOrderToPriority < ActiveRecord::Migration
  def change
    rename_column :resources, :order, :priority
  end
end
