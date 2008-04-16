class Post < DataMapper::Base
  property :slug, :string, :key => true
  property :body, :text, :nullable => false
  property :title, :string, :nullable => false
  property :published_at, :datetime, :index => true
  property :updated_at, :datetime
  property :format, :string, :nullable => false
  
  def formatted_body
    Formatter.format(self.format, self.body)
  end
  def to_param
    self.slug
  end
  def updated_or_published_at
    updated_at || published_at
  end
  def published?
    published_at
  end
end
