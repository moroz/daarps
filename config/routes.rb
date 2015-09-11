Rails.application.routes.draw do
  get '/offers/:locale' => 'offers#index', locale: /pl|de/
  get '/offers/new' => 'offers#new'
  get '/offers/:id' => 'offers#show'
  get '/offers/:locale/:id' => 'offers#show', locale: /pl|de/
  resources :offers#, :only => [:index, :show, :new, :create]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get '/kontakt' => 'pages#contact'
  get '/angebote' => 'offers#index', locale: 'de'
  get '/oferty' => 'offers#index', locale: 'pl'
  get '/pracodawca' => 'pages#employer', locale: 'pl'
  get '/arbeitgeber' => 'pages#employer', locale: 'de'

  get "/:locale" => 'pages#home', locale: /pl|de/
  get "/kontakt/:locale" => "pages#contact", locale: /pl|de/
  get "/offers/:locale" => "pages#offers", locale: /pl|de/
  get "/employer/:locale" => "pages#employer", locale: /pl|de/
end
