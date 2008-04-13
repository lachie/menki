module Admin
class Base < Application
  before :require_login
  
  protected
    def require_login
      unless session[:logged_in]
        redirect "/admin/session/new" # url(:admin_new_session) no workie?
        throw :halt
      end
    end
end
end
