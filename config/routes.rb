Bootleggers::Application.routes.draw do
  get "home/index"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'home#index'
end
