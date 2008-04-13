module Admin
class Session < Admin::Base
  skip_before :require_login
  
  def new
    render
  end
  def destroy
    session[:logged_in] = nil
    redirect url(:new_session)
  end
end
end
