Rails.application.routes.draw do
  
  root 'artists#index'

  resources :artists do
    resources :songs
  end
  
  resources :billboards do
    resources :songs do
      put :add
      end
  end


end
