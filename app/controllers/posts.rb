class Posts < Application
  provides :atom
  
  def index
    @posts = Post.all(:published_at.not => nil, :order => "published_at DESC", :limit => 5)
    display @posts
  end

  def show
    @post = Post.first(params[:id], :published_at.not => nil)
    raise NotFound unless @post
    display @post
  end

end
