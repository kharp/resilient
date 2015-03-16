class Resource < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged 

  has_attached_file :preview_image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :preview_image

  scope :default_order, -> { order(priority: :desc) }
  scope :enabled, -> { where(disabled: false) }
  scope :top, -> { default_order.limit 10 }
end
