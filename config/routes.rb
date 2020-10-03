Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions'
}
namespace :admins do
 resources :listing_genres, only: [:index, :create, :edit, :update]
 resources :order_genres, only: [:index, :create, :edit, :update]
 resources :users, only: [:index, :show, :edit, :update]
 resources :orders, only: [:index, :show]
 resources :contacts
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
 get 'users/unsubscribe/:user_id' => 'users#unsubscribe', as: 'unsubscribe'
 patch 'users/unsubscribe/:user_id' => 'users#confirm', as: 'confirm'
 get 'orders/new/:listing_work_id' => 'orders#new', as: 'new_order'
 get 'orders/new/:order_work_id' => 'orders#order_new', as: 'order_work_new'
 get 'orders/thanks' => 'orders#thanks', as: 'thanks'
 get 'order_works/:order_work_id/proposal' => 'proposals#new', as: 'new_proposal'
 get 'users/proposals/index' => 'proposals#index', as: 'proposals'
 get 'order_work/:order_work_id/proposals' => 'proposals#order_proposal', as: 'order_proposals'
 get 'proposal/:proposal_id/accept' => 'accepts#new', as: 'new_accept'
 get 'accept/thanks' => 'accepts#thanks'
 resources :listing_works
 resources :orders, only: [:create, :show, :index]
 resources :rooms, only: [:index, :show, :create]
 resources :contacts
 resources :order_works do
  resources :proposals, only: [:index, :create, :destroy,]
 end
 resources :accepts, only: [:create, :index, :show]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
