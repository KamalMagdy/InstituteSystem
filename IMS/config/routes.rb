Rails.application.routes.draw do
  resources :tags
  resources :coursestudenttracks
  resources :coursestafftracks
  resources :assignmentstaffstudents
  resources :staffs
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
get 'oauth2callback' => 'documents#set_google_drive_token' # user return to this after login
get 'list_google_doc'  => 'documents#list_google_docs', :as => :list_google_doc #for listing the 
                                                                                  #google docs
get 'download_google_doc'  => 'documents#download_google_docs', :as => :download_google_doc #download

  mount Commontator::Engine => '/commontator'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, controllers: { registerations: 'students/registerations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
