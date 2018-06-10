Rails.application.routes.draw do
  get 'events/index'
  resources :events
  resources :messages
  get 'message' , to: 'messages#index'

  get 'notifications', to:'notifications#index' 
  get 'current_user' => "home#current_user"

  resources :cvs do
    get 'company', on: :collection
  end

  resources :courses_tracks
  resources :lists
  resources :coursestudenttracks do
    member do
      put "/update", to: "coursestudenttracks#update"
    end 
  end
  resources :coursestafftracks do
    member do
      post 'beforenew' => 'coursestafftracks#beforenewpost'
    end
  end
  resources :assignmentstaffstudents do
    member do
      post 'submitcodereview' => 'assignmentstaffstudents#submitcodereview'
    end
  end
  resources :staffs
  resources :events
  resources :courses do
    member do
      put "upload", to: "assignmentstaffstudents#new"
      get "grades", to:"coursestudenttracks#show"
    end 
  end
  resources :assignments do
    member do
      post 'beforenew' => 'assignments#beforenewpost'
    end
  end
  get "/totrack", to: "assignments#beforenew"
  get "/tochoosetrack", to: "coursestafftracks#beforenew"
  resources :tracks
  resources :groups
  resources :posts, path: 'home' do
  member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
  end
end
get 'tags/:tag', to: 'posts#index', as: :tag
  mount Commontator::Engine => '/commontator'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, controllers: { registrations: 'students/registrations', sessions: "students/sessions" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
