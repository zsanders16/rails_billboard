Rails.application.routes.draw do
  
  root 'artists#index'

  #patch 'billboard/:id/add' => 'billboards#add', as: :add_tobillboard
  resources :artists do
    resources :songs
  end
  
  resources :billboards do
    resources :songs do
      put :add
      end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
