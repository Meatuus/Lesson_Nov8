Rails.application.routes.draw do
	# get 'sessions/new'
	#
	# get 'sessions/create'
	#
	# get 'sessions/destroy'

	resource :sessions, only: %i(new create destroy)
	# get 'users/new'
	#
	# get 'users/create'
	root 'users#new'

	resource :users, only: %i(new create)
	# resource :users, only: [:new, :create] - same as above line

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
