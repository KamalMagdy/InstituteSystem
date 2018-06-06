Rails.application.routes.draw do
  resources :courses_tracks
  resources :lists
  resources :coursestudenttracks
  resources :coursestafftracks
  resources :assignmentstaffstudents
  resources :staffs
  resources :tags
  resources :courses do
    member do
      put "upload", to: "assignmentstaffstudents#new"
      # put "uploadmaterial", to: "coursestafftracks#new"
      get "grades", to:"coursestudenttracks#show"
    end 
  end
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
  devise_for :students, controllers: { registrations: 'students/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#mn show course
#<%= link_to uploadmaterial_course_path(@course), method: :put do %>Upload new material<% end %>

