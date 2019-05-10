Rails.application.routes.draw do

  devise_for :users
  resources :notifications
  resources :events
  resources :conferences do
    get :map, on: :collection
  end
  resources :timetables
  resources :users do
    collection {post :import}
    get :import, on: :collection
    get :indexU, on: :collection
    get :editU, on: :collection
    get :badge, on: :collection
    get :account, on: :collection
    get :notificationsU, on: :collection
    get :badgeA, on: :collection
    get :coa, on: :collection
    get :changepw, on: :collection
  end
  resources :scans do
    get :qrU, on: :collection
  end
  resources :bookings do
    member do
      put :toggle_certificate
    end
    get :existing, on: :collection

  end
  resources :pages do
    get :home, on: :collection
  end


  match "/403", to: "errors#error_403", via: :all
  match "/404", to: "errors#error_404", via: :all
  match "/422", to: "errors#error_422", via: :all
  match "/500", to: "errors#error_500", via: :all

  get :ie_warning, to: 'errors#ie_warning'
  get :javascript_warning, to: 'errors#javascript_warning'

  get 'scans/index'

  root to: "bookings#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
