Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root :to => "public/homes#about"

  scope module: "public" do
    get "my_page" => "users#show"
    resources :users, only: [:edit, :update]
    resources :intakes, only: [:create, :update, :edit, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
