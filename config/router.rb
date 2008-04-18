Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  r.match('/admin').to(:controller => 'admin/posts', :action => 'index').name(:admin)
  r.namespace :admin do |admin|
    admin.resources :posts, :name_prefix => "admin_"
    admin.match("/posts/preview", :method => :post).to(:controller => 'posts', :action => 'preview')
    admin.match("/login", :method => :get).to(:controller => 'session', :action => 'new').name(:admin_login)
    admin.match("/login", :method => :post).to(:controller => 'session', :action => 'create').name(:admin_login)
    admin.match("/login/complete").to(:controller => 'session', :action => 'complete').name(:admin_login_complete)
    admin.match("/logout", :method => :post).to(:controller => 'session', :action => 'destroy').name(:admin_logout)
  end
  r.resources :posts
  r.match('/').to(:controller => 'posts', :action =>'index').name(:home)
end
