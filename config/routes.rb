Rails.application.routes.draw do

  get 'scans/index'
  get 'scans/scan'
  resources :notifications
  resources :events
  resources :conferences do
    get :map, on: :collection
  end
  resources :timetables do
    get :timetable, on: :collection
  end
  resources :users do
    get :indexU, on: :collection
    get :badge, on: :collection
    get :account, on: :collection
  end
  resources :scans do
    get :qrU, on: :collection
  end
  resources :bookings do
    get :existing, on: :collection
    get :import, on: :collection
  end

  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'


  root to: "pages#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
