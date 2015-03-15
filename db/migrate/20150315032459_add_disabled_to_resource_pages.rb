class AddDisabledToResourcePages < ActiveRecord::Migration
  def change
    add_column :resource_pages, :disabled, :boolean, default: false
  end
end
