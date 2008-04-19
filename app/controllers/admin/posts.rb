module Admin
class Posts < Admin::Base
  provides :js #:xml, :yaml

  def index
    @posts = Post.all
    display @posts
  end
  
  def show
    @post = Post.first(params[:id])
    raise NotFound unless @post
    display @post
  end

  def new
    only_provides :html
    @post = Post.new
    render
  end

  def edit
    only_provides :html
    @post = Post.first(params[:id])
    raise NotFound unless @post
    render
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect url(:admin_post, @post.id) + ".#{content_type}"
    else
      raise BadRequest
    end
  end

  def update
    @post = Post.first(params[:id])
    raise NotFound unless @post
    if @post.update_attributes(params[:post])
      redirect url(:admin_post, @post.id)
    else
      raise BadRequest
    end
  end

  def destroy
    @post = Post.first(params[:id])
    raise NotFound unless @post
    if @post.destroy!
      redirect url(:admin_post)
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
  
end
end
