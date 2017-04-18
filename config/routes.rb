Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
    	post 'authenticate', to: 'authentication#authenticate'
    	post 'register', to: 'authentication#register'
    	resources :trips, only: [:index]
    end
  end

end
