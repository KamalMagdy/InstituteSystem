Rails.application.routes.draw do
  resources :coursestudenttracks
  resources :coursestafftracks
  resources :assignmentstaffstudents
  resources :staffs
  resources :courses
  resources :assignments
  resources :tracks
  resources :groups
  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, controllers: { registerations: 'students/registerations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
