Bookhub::Application.routes.draw do
  resources :polls do
    resources :options do
      resources :votes
    end

    member do
      put :close
    end
  end

  root :to => "polls#index"

  mount AuthensiveClient::Engine, at: "/session"
end
