Rails.application.routes.draw do
  get '/offers/:locale' => 'offers#index', locale: /pl|de/
  get '/offers/new' => 'offers#new'
  get '/offers/:id' => 'offers#show'
  get '/offers/:locale/:id' => 'offers#show', locale: /pl|de/
  resources :offers#, :only => [:index, :show, :new, :create]

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get '/angebote' => 'offers#index', locale: 'de'
  get '/oferty' => 'offers#index', locale: 'pl'
  get '/impressum' => 'pages#impressum'

  get "/:locale" => 'pages#home', locale: /pl|de/
  get "/kontakt/(:locale)" => 'pages#contact', locale: /pl|de/
  get "/contact/(:locale)" => "pages#contact", locale: /pl|de/
  get "/employer/(:locale)" => "pages#employer", locale: /pl|de/
  resources :pages
end
