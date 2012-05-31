# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player_statistic do
    player nil
    season nil
    games_played 1
    touchdowns 1
    converts_1 1
    converts_2 1
    interceptions 1
    sacks 1
    field_goals 1
  end
end
