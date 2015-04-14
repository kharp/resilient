class Block < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :blocked_user_id, presence: true
	validates_uniqueness_of :user_id, scope: :blocked_user_id
end
