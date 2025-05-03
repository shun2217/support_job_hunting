Rails.application.routes.draw do
  root 'base#home'

  resources :companies # 会社一覧
  resources :industries # 業界一覧
  resources :events # イベント一覧

end
