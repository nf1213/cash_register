Rails.application.routes.draw do

  get 'static_pages/manager_functions'
  get 'employees/sign_in'
  post 'employees/sign_in_employee'
  post 'employees/sign_out'
  get '/modification_options/inverse_new'
  post '/modification_options/inverse_create'
  get 'employees/payroll'
  get 'employees/clock_in_out'
  post 'employees/clock'

  resources :items

  resources :restaurants

  resources :employees

  resources :sale_items, only: [:create]
  resources :sales, only: [:update]
  resources :modifications, only: [:create, :new]
  resources :modification_options, only: [:new, :create]

  root 'items#index'
end
