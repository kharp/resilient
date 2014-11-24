class Pin < ActiveRecord::Base
     belongs_to :user
     belongs_to :channel
     has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }


	acts_as_commontable
end