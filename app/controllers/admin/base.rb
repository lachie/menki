module Admin
class Base < Application
  before :require_login
  layout 'admin'
  
  protected
    def require_login
      unless cookies[:logged_in_identity_url] && valid_admin_open_id?(cookies[:logged_in_identity_url])
        redirect url(:admin_login)
        throw :halt
      end
    end
    def valid_admin_open_id?(open_id_url)
      MenkiConfig.admin_open_id_urls.map {|u| URI.parse(u)}.include?(URI.parse(open_id_url))
    rescue URI::InvalidURIError
      false
    end
end
end
