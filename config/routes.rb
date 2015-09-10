Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  get '/kontakt' => 'pages#contact'
  get '/angebote' => 'pages#offers', locale: 'de'
  get '/oferty' => 'pages#offers', locale: 'pl'
  get '/pracodawca' => 'pages#employer', locale: 'pl'
  get '/arbeitgeber' => 'pages#employer', locale: 'de'

  get "/:locale" => 'pages#home', locale: /pl|de/
  get "/kontakt/:locale" => "pages#contact", locale: /pl|de/
  get "/offers/:locale" => "pages#offers", locale: /pl|de/
  get "/employer/:locale" => "pages#employer", locale: /pl|de/
end
