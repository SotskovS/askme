Rails.application.routes.draw do
	root 'users#index'

	resources :users, exept: [:destroy]
	resources :questions

end
