class Posts < Application
  provides :atom
  
  def index
    @posts = Post.all(:published_at.not => nil, :order => "published_at DESC", :limit => 5)
    display @posts
  end

  def show
    @post = Post[params[:id]]
    raise NotFound unless @post
    display @post
  end

end
