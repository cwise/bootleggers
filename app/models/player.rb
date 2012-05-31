class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :retired
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :player_statistics, :dependent => :destroy
  
  def full_name
    "#{first_name} #{last_name}"
  end
  alias :name :full_name
  
end
