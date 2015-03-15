class AddImageToResourcePages < ActiveRecord::Migration
  def change
    rename_column :resource_pages, :preview_image, :preview_image_file_name
    add_column :resource_pages, :preview_image_content_type, :string
    add_column :resource_pages, :preview_image_file_size, :integer
    add_column :resource_pages, :preview_image_updated_at, :datetime
  end
end
