class Channel < ActiveRecord::Base
	belongs_to :user

  has_many :pins, dependent: :destroy

  acts_as_commontable
end
