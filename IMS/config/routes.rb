Rails.application.routes.draw do
  resources :posts
  resources :groups
  resources :tracks
  resources :assignments
  resources :courses
  resources :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
