Rails.application.routes.draw do
  resources :rooms

  resources :members do
    collection do
      get 'change_room'
      post 'change_room'
    end
  end

  resources :purchases do
    collection do
      get 'not_found'
    end
  end

  root 'statics#home'
end
