Rails.application.routes.draw do
  root 'prefectures#index'
  resources :prefectures, only: %i[index show]
  get '/prefectures/:id/archives/:yyyymm', to: 'prefectures#archives', as: :prefecture_archive
end
