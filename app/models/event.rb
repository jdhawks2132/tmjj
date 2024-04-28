class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :event_participants
  has_many :participants, through: :event_participants, source: :user
end
