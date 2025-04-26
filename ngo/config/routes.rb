Rails.application.routes.draw do
  # Root route points to CountryDataFinals index
  root 'country_data_finals#index'
  
  # Simple routes for queries
  get 'queries', to: 'queries#index'
  post 'queries/results', to: 'queries#results'
  
  # CountryDataFinals scaffold routes
  resources :country_data_finals
  
  # Rails health check route
  get "up" => "rails/health#show", as: :rails_health_check
end