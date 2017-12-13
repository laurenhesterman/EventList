class Event < ActiveRecord::Base
    validates :name, :location, presence: true, length: { in: 2..30 }
    validates :state, presence: true, length: { is: 2 }
    
    has_many :comments
    belongs_to :user
    has_many :event_attendees, through: :attendees, source: :user
end
