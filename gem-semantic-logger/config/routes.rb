Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'greeting/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
