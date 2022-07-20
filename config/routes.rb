Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
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
  # Translation paths
  get '/wiki/:id/translate', to: 'wiki#edit_translation', as: 'edit_translation'
  patch '/wiki/:id/translate', to: 'wiki#update_translation', as: 'update_translation'
end
