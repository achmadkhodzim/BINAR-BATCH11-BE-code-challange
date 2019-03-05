Rails.application.routes.draw do
  get '/', to: redirect('/books')
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  put '/bayar/:id', to: 'orders#bayar', as: 'bayar'
  resources :categories
  resources :books
  resources :orders
  resources :users

end
