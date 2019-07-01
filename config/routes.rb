Rails.application.routes.draw do
  get 'clock_events/index'
  get 'clock_events/show'
  post 'clock_events/new'
  get 'clock_events/edit'
  get 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
