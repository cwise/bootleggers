Bootleggers::Application.routes.draw do
  get "statistics/index"
  get "statistics/scoring"
  get "home/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'home#index'
end
