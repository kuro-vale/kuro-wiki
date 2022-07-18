Rails.application.routes.draw do
  root 'wiki#index'
  devise_for :users, skip: :all

  devise_scope :user do
    post 'auth/register', to: 'devise/registrations#create'
    post 'auth/login', to: 'devise/sessions#create'
    delete 'auth/logout', to: 'devise/sessions#destroy'
  end

  resources :wiki

  get '/:username/wiki', to: 'users_wiki#index', as: 'users_wiki'
end
