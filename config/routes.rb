Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root "homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  get 'tag_searches/search'=> 'tag_searches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows', on: :member
    get 'followers', on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end