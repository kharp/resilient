class Channel < ActiveRecord::Base
	belongs_to :user

  has_many :pins, dependent: :destroy

  has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image

  def self.my_channels(user)
    Channel.where("user_id = ?", user.id)
  end
end
