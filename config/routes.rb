Rails.application.routes.draw do
  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions'
}
namespace :admins do
 resources :listing_genres, only: [:index, :create, :edit, :update]
 resources :order_genres, only: [:index, :create, :edit, :update]
 resources :users, only: [:index, :show, :edit, :update]
 resources :orders, only: [:index, :show]
end

  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
}
scope module: :users do
 root 'homes#top'
 get 'users/mypage' => 'users#show', as: 'mypage'
 get 'users/mypage/edit' => 'users#edit', as: 'edit_user'
 patch 'users/mypage' => 'users#update', as: 'update_user'
 get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
 put 'users/unsubscribe' => 'users#confirm', as: 'confirm'
 resources :listing_works, except: [:destroy]
 resources :order_works, except: [:destroy]
 resources :orders
 resources :proposals
 resources :chats, only: [:show]
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
