class Film < ActiveRecord::Base
  attr_accessible :title, :year, :length, :synopsis, :trailer, :rt_rating
  
  has_many :events
  
  validates :title, presence: true
  validates :year, presence: true
  validates :length, presence: true
  validates :synopsis, presence: true
end