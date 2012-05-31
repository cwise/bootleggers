class CreatePlayerStatistics < ActiveRecord::Migration
  def change
    create_table :player_statistics do |t|
      t.references :player
      t.references :season
      t.integer :games_played
      t.integer :touchdowns
      t.integer :converts_1
      t.integer :converts_2
      t.integer :interceptions
      t.integer :sacks
      t.integer :field_goals

      t.timestamps
    end
    add_index :player_statistics, :player_id
    add_index :player_statistics, :season_id
  end
end
