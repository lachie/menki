module Admin
class Base < Application
  before :require_login
  layout 'admin'
  
  protected
    def require_login
      unless session[:logged_in]
        redirect url(:admin_login)
        throw :halt
      end
    end
end
end
