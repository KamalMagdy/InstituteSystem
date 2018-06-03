Rails.application.routes.draw do
  resources :coursestudenttracks
  resources :coursestafftracks
  resources :assignmentstaffstudents
  resources :staffs
  resources :tags
  resources :courses
  resources :assignments
  resources :tracks
  resources :groups
  resources :posts do
  member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
  end
end
  mount Commontator::Engine => '/commontator'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, controllers: { registerations: 'students/registerations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
