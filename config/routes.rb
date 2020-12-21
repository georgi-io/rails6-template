Rails.application.routes.draw do
  root 'application#index', as: :application_index

  get 'auth/secured' => 'auth0#secured', as: :auth0_secured
  get 'auth/auth0/callback' => 'auth0#callback', as: :auth0_callback
  get 'auth/failure' => 'auth0#failure', as: :auth0_failure
  get 'auth/logout' => 'auth0#logout', as: :auth0_logout
end
