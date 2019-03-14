Rails.application.routes.draw do

  get 'scan/new'
  get 'scan/create'
  resources :notifications
  resources :events
  resources :conferences
  resources :timetables
  resources :users
  resources :bookings do
    get :newuser, on: :collection
    get :existing, on: :collection
  end

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'


  root to: "pages#home"

  resources :scan, only: [:new]
  root to: "scan#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
