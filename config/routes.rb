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
  get 'items/edit_index'

  resources :items, except: [:show]

  resources :restaurants

  resources :employees

  resources :sale_items, only: [:create, :destroy, :show]
  resources :sales, only: [:update]
  resources :modifications, except: [:show]
  resources :modification_options, only: [:new, :create]
  resources :sale_item_modifications, only: [:new, :create, :destroy]

  root 'items#index'
end
