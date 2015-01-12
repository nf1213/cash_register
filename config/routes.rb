Rails.application.routes.draw do

  get 'static_pages/manager_functions'
  get 'employees/sign_in'
  post 'employees/sign_in_employee'
  post 'employees/sign_out'

  resources :items

  resources :restaurants

  resources :employees

  resources :sale_items, only: [:create]
  resources :sales, only: [:update]
  resources :modifications, only: [:create, :new]

  root 'items#index'
end
