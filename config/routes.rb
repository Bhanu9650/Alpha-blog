Rails.application.routes.draw do
 resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'page#home'

 get 'about', to: 'page#about'

 get 'signup', to: 'users#new'
 
 resources :users, except: [:new]
 #post 'users', to: 'users#create'

end
