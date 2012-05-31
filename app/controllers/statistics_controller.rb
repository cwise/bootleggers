class StatisticsController < ApplicationController
  def index
  end
  
  def scoring
    @statistics=PlayerStatistic.includes(:player).all.group_by(&:player).map{|k, v| Statistic.new(player: k, player_statistics: v)}
    
  end
end
