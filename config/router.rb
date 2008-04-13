Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  r.namespace :admin do |admin|
    admin.resources :posts
    admin.resources :sessions
  end  
  r.match('/admin').to(:module => 'admin', :controller => 'posts', :action => 'index')
  r.match('/').to(:controller => 'posts', :action =>'index')
end
