class Statistic
  include ActiveModel::AttributeMethods
  include ActiveModel::MassAssignmentSecurity
  
	attr_accessor :player
	attr_accessor :player_statistics
	attr_accessible :player, :player_statistics
	attr_accessor :rank
  
	def initialize(attributes={})
    unless attributes.empty?
      @player=attributes[:player] if attributes.has_key?(:player)
      @player_statistics=attributes[:player_statistics] if attributes.has_key?(:player_statistics)
	  end
	end

  def touchdowns
    player_statistics.sum(&:touchdowns)
  end
  
  def games_played
    player_statistics.sum(&:games_played)
  end
  
  def converts_1
    player_statistics.sum(&:converts_1)
  end  
  
  def converts_2
    player_statistics.sum(&:converts_2)
  end  
  
  def field_goals
    player_statistics.sum(&:field_goals)
  end  
  
  def interceptions
    player_statistics.sum(&:interceptions)
  end
  
  def sacks
    player_statistics.sum(&:sacks)
  end
  
  def points
    player_statistics.sum(&:points)
  end  
  
  def player_name
    full_name = player.full_name
    full_name = "x-<em>#{full_name}</em>".html_safe if player.retired?
    full_name
  end
end