class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_attached_file :image, styles: {
    large: "500x500",
    medium: "300x300>",
    thumb: "100x100>"
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'

  has_many :user_participating_events, foreign_key: 'participator_id'
  has_many :participating_events, through: :user_participating_events, class_name: 'Event'
end
