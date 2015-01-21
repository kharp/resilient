class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_many :channels

  validates :name, presence: true

  # Callbacks
  after_create :add_to_mailing_list

  private
  def add_to_mailing_list
    Mailchimp::AddToMailingList.subscribe(self)
  end

end

def forem_name
  name
end