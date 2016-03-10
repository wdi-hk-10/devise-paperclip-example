class Event < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :user_participating_events, foreign_key: 'participating_event_id'
  has_many :participators, through: :user_participating_events, class_name: 'User'
end
