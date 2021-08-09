Rails.application.routes.draw do
  
  devise_for :renters
  devise_for :agents
  devise_scope :agent do
    get '/agents/sign_out' => 'devise/sessions#destroy'
  end
  resources:companies
  resources:welcome
  resources:properties
  root to: "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
