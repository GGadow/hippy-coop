Rails.application.routes.draw do
  resources :rooms
  resources :members 

  root 'statics#home'
end
