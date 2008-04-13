Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  r.namespace :admin do |admin|
    admin.resources :posts
    admin.resource :session
  end  
  r.match('/admin').to(:controller => 'admin/posts', :action => 'index')
  r.match('/').to(:controller => 'posts', :action =>'index')
end
