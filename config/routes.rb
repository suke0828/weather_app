Rails.application.routes.draw do
  root 'weather_reports#index'
  resources :weather_reports
end
