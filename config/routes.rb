Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'discovery', action: :index, controller: 'discovery'
  resources :vendors, :products, :ownerships
  
  root :to => redirect('/discovery')
end
