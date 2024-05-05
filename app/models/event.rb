class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :event_participants
  has_many :participants, through: :event_participants, source: :user

  enum event_type: {
    concert: 0,
    date_night: 1,
    dinner: 2,
    misc: 3,
    pickleball: 4,
    softball: 5,
    travel: 6
  }

end
