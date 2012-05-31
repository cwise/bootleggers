class RecordsController < ApplicationController
  def index
  end
  
  def scoring
    @records=PlayerStatistic.includes(:player).all.sort{|a, b| b.points <=> a.points}.slice(0, 10)
  end

  def touchdowns
    @records=PlayerStatistic.includes(:player).all.sort{|a, b| b.touchdowns <=> a.touchdowns}.slice(0, 10)
  end
  
  def interceptions
    @records=PlayerStatistic.includes(:player).all.sort{|a, b| b.interceptions <=> a.interceptions}.slice(0, 10)
  end  

  def sacks
    @records=PlayerStatistic.includes(:player).all.sort{|a, b| b.sacks <=> a.sacks}.slice(0, 10)
  end  
end
