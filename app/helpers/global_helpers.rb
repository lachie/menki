module Merb
  module GlobalHelpers
    def logged_in?
      session[:logged_in]
    end
  end
end
