Bootleggers::Application.routes.draw do
  get "home/index"
  
  resources :statistics, :only => [:index] do
    collection do
      get :scoring
      get :interceptions
      get :games_played
      get :touchdowns
      get :sacks
    end
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'home#index'
end
