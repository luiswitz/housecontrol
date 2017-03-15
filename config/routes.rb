Rails.application.routes.draw do
  resources :credit_card_expenses
  resources :incomes
  resources :expenses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
