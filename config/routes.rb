Rails.application.routes.draw do
  get '/employees/groups' => 'employees#groups'
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
