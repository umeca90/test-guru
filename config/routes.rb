# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}
  root 'tests#index'
  #get :signup, to: 'users#new'
  #get :login, to: 'sessions#new'
  #delete :logout, to: 'sessions#destroy'

  #resources :users, only: :create
  #resource  :sessions, only: :create

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests
  end

end
