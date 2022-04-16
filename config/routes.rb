Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root :to => "public/homes#about"

  scope module: "public" do
    get "users/rank" => "users#rank"
    resources :users, only: [:show, :edit, :update]
    resources :intakes, only: [:new, :create, :update, :edit, :destroy]
  end

  namespace :admin do
    resources :notifications, only: [:create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
