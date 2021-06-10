Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
    resources :users
    resources :majors
    resources :subjects
    resources :subject_classes
    resources :subject_class_teachers
    resources :subject_class_students
    resources :subject_class_materials
    apipie
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { sessions: :sessions },
                         path_names: { sign_in: :login }
      resources :users, only: %i[index show create update destroy] do
        collection do
          post :forgot_password
          put :update_locale
        end
      end
      resources :subject_classes do
        collection do
          get :by_student
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
