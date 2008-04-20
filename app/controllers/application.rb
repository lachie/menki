class Application < Merb::Controller
  protected
    # Filter used to require the user be logged in
    def require_login
      unless logged_in?
        redirect url(:admin_login)
        throw :halt
      end
    end
    # Returns whether the current request has valid log in credentials
    def logged_in?
      cookies[:logged_in_identity_url] && valid_admin_open_id?(cookies[:logged_in_identity_url])
    end
    # Returns whether the given OpenID URL is in the menki.yml's list of admin_open_id_urls
    def valid_admin_open_id?(open_id_url)
      MenkiConfig.admin_open_id_urls.map {|u| URI.parse(u)}.include?(URI.parse(open_id_url))
    rescue URI::InvalidURIError
      false
    end
    # Return the public post URL if the post is published or the preview URL if not
    def post_url(post)
      if post.published?
        url(:post, post)
      else
        url(:preview_post, post.id)
      end
    end
end
