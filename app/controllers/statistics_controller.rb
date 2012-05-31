class StatisticsController < ApplicationController
  def index
  end
  
  def scoring
    @statistics=get_statistics.sort{|a, b| b.points <=> a.points}
  end

  def touchdowns
    @statistics=get_statistics.reject{|s| s.touchdowns.zero?}.sort{|a, b| b.touchdowns <=> a.touchdowns}
  end
  
  def interceptions
    @statistics=get_statistics.reject{|s| s.interceptions.zero?}.sort{|a, b| b.interceptions <=> a.interceptions}
  end  

  def sacks
    @statistics=get_statistics.reject{|s| s.sacks.zero?}.sort{|a, b| b.sacks <=> a.sacks}
  end  
  
  def games_played
    @statistics=get_statistics.sort{|a, b| b.games_played <=> a.games_played}
  end  
  
  private
  def get_statistics
    PlayerStatistic.includes(:player).all.group_by(&:player).map{|k, v| Statistic.new(player: k, player_statistics: v)}
  end
end
