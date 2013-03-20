Videoful::Application.routes.draw do
  resources :signups, except: [:show, :update] do
    member do
      post "toggle_contacted"
    end
  end
  root :to => 'static#home'
end
