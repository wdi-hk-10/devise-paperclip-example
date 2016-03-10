class UserParticipatingEvent < ActiveRecord::Base
  belongs_to :participator, class_name: 'User', foreign_key: 'participator_id'
  belongs_to :participating_event, class_name: 'Event', foreign_key: 'participating_event_id'
end
