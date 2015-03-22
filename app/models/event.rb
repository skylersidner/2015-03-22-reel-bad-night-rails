class Event < ActiveRecord::Base
  attr_accessible :start_time, :host_msg, :current_event, :film_id
  
  has_many :drinks
  belongs_to :film

  has_and_belongs_to_many :patrons
  
  validates :start_time, presence: true
end