class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :state, presence: true, length: { is: 2 }
  validates :password, presence: true, on:create
  has_many :comments
  has_many :events
  has_many :events_attending, through: :attendees, source: :event
  has_secure_password
end
