Rails.application.routes.draw do
	root 'static_pages#index'
		get  '/help',    to: 'static_pages#help'
	    get  '/about',   to: 'static_pages#about'
	    get  '/contact', to: 'static_pages#contact'

	# 用户登陆及注销
	get '/login' ,      to: 'telnet#new'
    post '/login' ,     to: 'telnet#create'
    delete '/logout' ,  to: 'telnet#destroy'
    get  '/signup',     to: 'users#new'
    get '/verify',      to: 'users#verify'

    resources :users
    
    resources :tenants  do
        member do
            get 'manage', :manage
        end
    end

    resources :tasks do
        member do
            get 'finish', :finish
        end
    end

    resources :sessions
end
