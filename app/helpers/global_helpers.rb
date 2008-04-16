module Merb
  module GlobalHelpers
    def logged_in?
      cookies[:logged_in]
    end
    def explanation(text)
      %(<em class="explanation">#{text}</em>)
    end
  end
end
