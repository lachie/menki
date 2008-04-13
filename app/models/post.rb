class Post < DataMapper::Base
  property :slug, :string
  property :body, :text
  property :title, :string
  property :published_at, :datetime
  property :updated_at, :datetime
end
