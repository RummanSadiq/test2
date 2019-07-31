Rails.application.routes.draw do

	get '/welcome', to: "welcome#index"
 
 	resources :articles do
  		resources :comments 
  	end


 	root 'articles#index'

 	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
