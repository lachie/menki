module Merb
  module GlobalHelpers
    def explanation(text)
      %(<em class="explanation">#{text}</em>)
    end
    def post_title(post)
      (post.title && !post.title.empty?) ? post.title : "Untitled"
    end
  end
end
