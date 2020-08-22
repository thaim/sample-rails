require 'sidekiq/web'

Rails.application.routes.draw do
  get 'error/index'
  ActiveAdmin.routes(self)
  get 'greeting/index'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
