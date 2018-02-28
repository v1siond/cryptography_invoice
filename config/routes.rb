Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    authenticated :user do
      get 'homepage' => 'main#index'
      get 'logout' => 'devise/sessions#destroy'
      root 'main#index', as: :authenticated_root
    end

    unauthenticated do
      get 'login' => 'devise/sessions#new'
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :clients, :products, :invoices, :companies

end
