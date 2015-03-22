class Drink < ActiveRecord::Base
  attr_accessible :name, :category, :description, :event_id  
  
  belongs_to :event
  
  validates :name, presence: true
  validates :category, presence: true
end