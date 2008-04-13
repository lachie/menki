require 'uri'
require 'openid'
require 'openid/consumer'
require 'openid/store/filesystem'

module Admin
class Session < Admin::Base
  skip_before :require_login
  
  def new
    render
  end

  def create
    @openid_url = params[:openid_url]
    redirect openid_consumer.begin(@openid_url).redirect_url(absolute_url(:home), absolute_url(:admin_login_complete))
  rescue OpenID::OpenIDError, Timeout::Error => e
    @error = e
    render :new
  end
  
  def complete
    response = openid_consumer.complete(request.send(:query_params), 'http://'+request.host+request.path)
    @openid_url = response.identity_url
    if response.status.to_s == 'success'
      if MenkiConfig.admin_open_id_urls.map {|url| URI.parse(url)}.include?(URI.parse(response.identity_url))
        session[:logged_in] = response.identity_url
        redirect url(:admin_posts)
      else
        @error = "OpenID URL not authorized"
        render :new
      end
    else
      @error = "Failure to authenticate OpenID URL"
      render :new
    end
  end
  
  def destroy
    session[:logged_in] = nil
    redirect url(:admin_posts)
  end
  
  protected
    def openid_consumer
      @openid_consumer ||= OpenID::Consumer.new(session, OpenID::Store::Filesystem.new(Merb.root / "tmp" / "openid"))
    end
end
end
