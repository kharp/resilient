class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_many :channels

  has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :image

  validates :name, presence: true

  # Callbacks
  after_create :add_to_mailing_list

  def admin?;admin;end
  private
  def add_to_mailing_list
    Mailchimp::AddToMailingList.subscribe(self)
  end
end

def forem_name
  name
end
