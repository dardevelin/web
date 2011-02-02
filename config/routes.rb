CodegramWeb::Application.routes.draw do
  devise_for :users

  # Admin sections
  namespace :admin do
    resources :posts
    match '/' => 'dashboards#show'
  end

  # Public sections
  constraints subdomain: 'blog' do
    match '/' => 'posts#index'
    match '/:year/:month/:id' => 'posts#show'
  end

  constraints BaseSubdomain do
    resource :pages, :controller => 'high_voltage/pages'
  end

  root :to => "high_voltage/pages#show", :id => 'home'

end
