Rails.application.routes.draw do
  get 'schedules/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :schedules
end
