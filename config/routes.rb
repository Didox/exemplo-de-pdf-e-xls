Rails.application.routes.draw do

  resources :funcionarios
  root to: "home#index"
end
