Rails.application.routes.draw do

  get 'static_pages/manager_functions'
  get 'employees/sign_in'
  post 'employees/sign_in_employee'
  get 'restaurants/sign_in'
  post 'restaurants/sign_in_restaurant'
  get 'employees/sign_out'
  get 'restaurants/sign_out'
  get '/modification_options/inverse_new'
  post '/modification_options/inverse_create'
  get 'employees/payroll'
  get 'employees/clock_in_out'
  post 'employees/clock'
  get 'items/edit_index'
  post 'sales/destroy_all'
  post 'items/remove_modifications'

  resources :restaurants, only: [:new, :create, :sign_in, :sign_in_restaurant]
  resources :items, except: [:show]
  resources :sale_items, only: [:create, :destroy, :show]
  resources :sales, only: [:update, :index, :destroy, :destroy_all]
  resources :modifications, except: [:show]
  resources :modification_options, only: [:new, :create]
  resources :sale_item_modifications, only: [:new, :create, :destroy]
  resources :employees, except: [:show]

  root 'items#index'
end
