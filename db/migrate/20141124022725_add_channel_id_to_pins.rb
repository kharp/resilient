class AddChannelIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :channel_id, :integer
  end
end
