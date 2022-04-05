Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root :to => "public/homes#about"

  namespace :public do
    scope "public" do
      get "users/my_page", to: "users#show"
      resources :users, only: [:show, :edit, :update]

    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
