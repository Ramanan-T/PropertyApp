Rails.application.routes.draw do
  
  devise_for :renters
  devise_for :agents
  devise_scope :agent do
    get '/agents/sign_out' => 'devise/sessions#destroy'
  end
  resources:companies
  resources:welcome
  resources:properties do
    get '/add_smartlock/:id(.:format)' => "properties#add_smartlock" ,:as => 'add_smartlock'
  end 
  resources:smartlock
  resources:codes
  root to: "welcome#index"

  get '/checkin' => 'checkin#index'
get '/checkin/new' => 'checkin#new'
post '/checkins' => 'checkin#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
