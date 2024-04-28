class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum role: { user: 0, admin: 1, superadmin: 2 }

  after_initialize :set_default_role, if: :new_record?

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :events
  has_many :event_participants
  has_many :participated_events, through: :event_participants, source: :event

  def set_default_role
    self.role ||= :user
  end

  def admin?
    role == 'admin' || role == 'superadmin'
  end

  def superadmin?
    role == 'superadmin'
  end

end
