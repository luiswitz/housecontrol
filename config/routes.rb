Rails.application.routes.draw do
  get 'incomes', to: 'incomes#index'
  get 'incomes/new'
  get 'incomes/edit'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
