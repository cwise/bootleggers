class Season < ActiveRecord::Base
  attr_accessible :title, :year
  validates :title, presence: true, uniqueness: true
  has_many :player_statistics, :dependent => :destroy
end
