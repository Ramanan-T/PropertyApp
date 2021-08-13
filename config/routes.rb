Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :renters
 
 
  devise_for :agents
  devise_scope :agent do
    get '/agents/sign_out' => 'devise/sessions#destroy'
    delete '/agents' => 'agents#destroy'
    
  end
  resources:companies
  resources:welcome
  resources:login do
  get '/index' => 'login#index',:as=> 'login_index'
  end
  resources:properties do
    get '/add_smartlock/:id(.:format)' => "properties#add_smartlock" ,:as => 'add_smartlock'
  end 
  root to: "welcome#index"

  resources:smartlock do
    delete '/agents/:id' => 'devise/sessions#destroy'
  end
  resources:codes
  get 'agents/:id' => 'agents#destroy', :via => :delete, :as => :admin_destroy_user
  post '/agentscreate', action: :create, controller: :agents
  get '/agents/new' => 'agents#new' 
  get '/checkin' => 'checkin#index'
get '/checkin/new' => 'checkin#new'
post '/checkins' => 'checkin#create'
get '/addsubagents', action: :addagents,controller: :agents, as: :addagents




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
