module Admin
class Posts < Admin::Base
  provides :js #:xml, :yaml

  def index
    @posts = Post.all
    display @posts
  end
  
  def show(id)
    @post = Post.first(id)
    raise NotFound unless @post
    display @post
  end

  def new
    only_provides :html
    @post = Post.new
    render
  end

  def edit(id)
    only_provides :html
    @post = Post.first(id)
    raise NotFound unless @post
    render
  end

  def create(post)
    @post = Post.new(post)
    if @post.save
      redirect_to_post
    else
      raise BadRequest
    end
  end

  def update(id, post)
    @post = Post.first(id)
    raise NotFound unless @post
    if @post.update_attributes(post)
      redirect_to_post
    else
      raise BadRequest
    end
  end

  def destroy(id)
    @post = Post.first(id)
    raise NotFound unless @post
    if @post.destroy!
      redirect url(:admin, :posts)
    else
      raise BadRequest
    end
  end
  
  def preview(format, body)
    only_provides :html
    Formatter.format(format, body)
  rescue Exception => e
    "<p><strong>#{e.message}</strong></p>"
  end
  
  def publish(id)
    only_provides :html
    @post = Post.first(id)
    @post.published_at = Time.now
    if @post.save
      redirect_to_post
    else
      raise BadRequest
    end
  end
  
  private
    # Redirect to the post keeping to the same content_type
    def redirect_to_post
      case content_type
      when :js
        redirect url(:post, @post) + ".js"
      when :html
        redirect post_url(@post)
      end
    end
end
end
