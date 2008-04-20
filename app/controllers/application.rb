class Application < Merb::Controller
  protected
    def logged_in?
      cookies[:logged_in_identity_url] && valid_admin_open_id?(cookies[:logged_in_identity_url])
    end
    def valid_admin_open_id?(open_id_url)
      MenkiConfig.admin_open_id_urls.map {|u| URI.parse(u)}.include?(URI.parse(open_id_url))
    rescue URI::InvalidURIError
      false
    end
end
