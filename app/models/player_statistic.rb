class PlayerStatistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :season
  attr_accessible :converts_1, :converts_2, :field_goals, :games_played, :interceptions, :sacks, :touchdowns
  validates :player, presence: true
  validates :season, presence: true
  
  def points
    touchdowns * 6 + converts_2 * 2 + converts_1 + field_goals * 3
  end
end
