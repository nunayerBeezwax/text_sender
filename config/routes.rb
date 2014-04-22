Twilio::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
root to: 'messages#index'
resources :messages, :only => [:index, :new, :create, :show]
end
