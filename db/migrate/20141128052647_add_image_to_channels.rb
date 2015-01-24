class AddImageToChannels < ActiveRecord::Migration
  def change
    add_attachment :channels, :image
  end
end
