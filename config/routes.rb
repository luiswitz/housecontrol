Rails.application.routes.draw do
  resources :credit_card_expenses
  resources :incomes
  resources :expenses
  resources :accounts
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  root to: 'expenses#index'
end
