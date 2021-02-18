Rails.application.routes.draw do
  
    devise_for :users
    root to: "home#index"

  get 'customers/calendar'
  get '/customers/calendar/:id' => 'customers#user_calendar'
  get '/customers/user/:id' => 'customers#user_customer'
  resources :customers, only: [:new, :create, :destroy, :show, :edit, :update, :index] do
  end

    
end
