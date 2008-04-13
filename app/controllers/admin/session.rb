module Admin
class Session < Admin::Base
  skip_before :require_login
  
  def new
    render
  end
  def create
    
  end
  def destroy
    session[:logged_in] = nil
    redirect url(:admin_posts)
  end
end
end
