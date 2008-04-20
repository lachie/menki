class Posts < Application
  def index
    provides :atom
    @posts = if (content_type == :atom)
      Post.all(:published_at.not => nil, :order => "published_at DESC", :limit => 15)
    else
      Post.all(:published_at.not => nil, :order => "published_at DESC")
    end
    display @posts
  end

  def show(id)
    @post = Post.first(:slug => id, :published_at.not => nil)
    raise NotFound unless @post
    display @post
  end
  
  before :require_login, :only => :preview
  def preview(id)
    @post = Post.first(:id => id)
    raise NotFound unless @post
    display @post
  end
  
  def home
    @post = Post.first(:published_at.not => nil, :order => "published_at DESC")
    display @posts
  end
end
