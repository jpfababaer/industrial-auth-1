Rails.application.routes.draw do
  root "users#feed"

  devise_for :users

  #2 For comments, the only routes we're concerned about is the ability to create a comment, update it, or delete it. Therefore, we can use except to remove the rest.
  resources :comments, except: [:index, :show, :new]
  
  #2 Specifically for the follow_requests, we are NOT interested in the GET routes of this route. Therefore, we use except to exclude all the GET routes. We still utilize the POST (:create), PATCH (:update), and DELETE (:delete).
  resources :follow_requests, except: [:index, :show, :new, :edit]

  #2 For likes, we ONLY need to utilize the :create and :destroy routes. Why? because the likes only fuctions either as liking something (= :create) or unliking something (= :destroy).
  resources :likes, only: [:create, :destroy]

  #2 For photos, we do NOT want to show all the photos inside of our database (which is what the Ruby logic is doing). Instead, we want to showcase the "discover" and "feed" section. Therefore, we use except to plug a whole with the index route - something we won't use.
  resources :photos, except: [:index]

  get ":username" => "users#show", as: :user
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/discover" => "users#discover", as: :discover
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following
end
