Rails.application.routes.draw do
  root 'wiki#index'
  
  resources :wiki
end
