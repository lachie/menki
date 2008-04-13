Merb.logger.info("Compiling routes...")
Merb::Router.prepare do |r|
  r.match('/admin').to(:controller => 'admin/posts', :action => 'index')
  r.namespace :admin do |admin|
    admin.resources :posts
    admin.resource :session
  end
  r.match('/posts.atom').to(:controller => 'posts', :action => 'index', :format => "atom")
  r.match('/').to(:controller => 'posts', :action =>'index')
end
