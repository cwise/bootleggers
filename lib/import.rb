require 'csv' 
require 'singleton'

class Import
  include Singleton
  
  def import_all
    import_stats import_seasons, import_players
  end
  
  def import_seasons
    seasons={}
    raw_seasons=read_file('seasons.csv')
    raw_seasons.each do |row|
      row = row.to_hash.with_indifferent_access
      new_season=Season.create(title: row[:season], year: row[:year])
      seasons[row[:season_id]]=new_season
    end
    seasons
  end
  
  def import_players
    players={}
    raw_players=read_file('players.csv')
    raw_players.each do |row|
      row = row.to_hash.with_indifferent_access
      new_player=Player.create(first_name: row[:first_name], last_name: row[:last_name], retired: row[:retired])
      players[row[:player_id]]=new_player
    end
    players    
  end
  
  def import_stats seasons, players
    raw_stats=read_file('stats.csv')
    raw_stats.each do |row|
      row = row.to_hash.with_indifferent_access  
      player_stat=PlayerStatistic.new(games_played: row[:games_played], touchdowns: row[:touchdowns], converts_1: row[:single_pt], converts_2: row[:double_pt], interceptions: row[:interceptions], sacks: row[:sacks], field_goals: row[:field_goals])
      player_stat.player_id=players[row[:player_id]].id   
      player_stat.season_id=seasons[row[:season_id]].id
      player_stat.save
    end    
  end

  private
  def read_file file_name
    csv_text = File.read(File.join(Rails.root, 'public', 'legacy', file_name))
    CSV.parse(csv_text, :headers => true)
  end
end
