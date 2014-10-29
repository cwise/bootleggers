class StatisticsController < ApplicationController
  def index
  end
  
  def scoring
    @statistics = get_statistics :points
  end

  def touchdowns
    @statistics = get_statistics :touchdowns
  end
  
  def interceptions
    @statistics = get_statistics :interceptions
  end  

  def sacks
    @statistics = get_statistics :sacks
  end  
  
  def games_played
    @statistics = get_statistics :games_played
  end  
  
  private
  def get_statistics type
    stats = PlayerStatistic.includes(:player).all.group_by(&:player).map{|k, v| Statistic.new(player: k, player_statistics: v)}
    stats = stats.reject{ |s| s.send(type).zero? }.sort{ |a, b| b.send(type) <=> a.send(type) }
    
    current_rank = 1
    previous_value = nil
    stats.each do |s| 
      s.rank = current_rank unless previous_value == s.send(type)
      previous_value = s.send(type)
      current_rank += 1
    end
    
    stats
  end
end
