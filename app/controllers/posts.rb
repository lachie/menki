class Posts < Application
  # provides :xml, :yaml, :js

  def index
    @posts = Post.all
    display @posts
  end

  def show
    @post = Post.first(params[:id])
    raise NotFound unless @post
    display @post
  end

end
