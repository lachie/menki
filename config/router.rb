Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  r.match('/admin').to(:controller => 'admin/posts', :action => 'index')
  r.namespace :admin do |admin|
    admin.resources :posts
    admin.match("/login", :method => :get).to(:controller => 'session', :action => 'new').name(:admin_login)
    admin.match("/login", :method => :post).to(:controller => 'session', :action => 'create').name(:admin_login)
    admin.match("/login/complete").to(:controller => 'session', :action => 'complete').name(:admin_login_complete)
    admin.match("/logout", :method => :post).to(:controller => 'session', :action => 'destroy').name(:admin_logout)
  end
  r.resources :posts
#  r.match('/posts.atom').to(:controller => 'posts', :action => 'index', :format => "atom")
  r.match('/').to(:controller => 'posts', :action =>'index').name(:home)
end
