Rails.application.routes.draw do
  get 'welcome/index'

  resources :videos
  resources :texts
  resources :pictures
  resources :walls
  root to: redirect('/welcome/index')
  get ':url' => 'walls#show'
  post '/redirect' => 'walls#url'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
