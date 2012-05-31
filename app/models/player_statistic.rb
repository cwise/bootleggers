class PlayerStatistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :season
  attr_accessible :converts_1, :converts_2, :field_goals, :games_played, :interceptions, :sacks, :touchdowns
end
