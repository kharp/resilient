class RenameResources < ActiveRecord::Migration
  def change
    rename_table :resource_pages, :resources
  end
end
