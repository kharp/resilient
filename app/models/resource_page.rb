class ResourcePage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged 

  has_attached_file :preview_image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }

  scope :default_order, -> { order(order: :asc) }
  scope :enabled, -> { where(disabled: false) }
end
