Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "pages#dashboard", as: :authenticated_root
    resources :users
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { sessions: :sessions },
                         path_names: { sign_in: :login }
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
