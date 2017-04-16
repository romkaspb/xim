Rails.application.routes.draw do
  root 'planes#index'
  put "planes/flyall", to: 'planes#flyall'
  put "planes/:id/fly", to: 'planes#fly'

  resources :planes, only: :index do
    resources :status_logs, only: :index
  end
  # resources :status_logs
  # resources :planes
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
