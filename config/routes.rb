Rails.application.routes.draw do
  
  root 'artists#index'

  patch 'add', to: 'billboards#add'
  resources :artists do
    resources :songs
  end
  
  resources :billboards do
    resources :songs
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
