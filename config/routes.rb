Rails.application.routes.draw do
  root 'base#home'

  resources :companies # 会社一覧
end
