Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  resources :contacts, :only => [:new, :create]

  get '/offers/:locale' => 'offers#index', locale: /pl|de/
  get '/offers/new' => 'offers#new'
  get '/offers/:id' => 'offers#show'
  get '/offers/:locale/:id' => 'offers#show', locale: /pl|de/
  resources :offers#, :only => [:index, :show, :new, :create]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get '/kontakt' => 'contacts#new'
  get '/angebote' => 'offers#index', locale: 'de'
  get '/oferty' => 'offers#index', locale: 'pl'
  get '/pracodawca' => 'pages#employer', locale: 'pl'
  get '/arbeitgeber' => 'pages#employer', locale: 'de'

  get "/:locale" => 'pages#home', locale: /pl|de/
  get "/kontakt/:locale" => "contacts#new", locale: /pl|de/
  get "/offers/:locale" => "pages#offers", locale: /pl|de/
  get "/employer/:locale" => "pages#employer", locale: /pl|de/
end