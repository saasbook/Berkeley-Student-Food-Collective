Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'discovery', action: :index, controller: 'discovery'
  resources :vendors, :products, :ownerships, :tags
  
  namespace :admin do 
  	resources :products, :vendors, :tags
  end
  
  root :to => redirect('/discovery')
end
