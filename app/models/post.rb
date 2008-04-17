class Post < DataMapper::Base
  property :slug, :string, :key => true
  property :body, :text, :nullable => false
  property :title, :string, :nullable => false
  property :published_at, :datetime, :index => true
  property :updated_at, :datetime
  property :format, :string, :nullable => false

  validates_true_for :body, :logic => (Proc.new do
    begin
      formatted_body
      true
    rescue Exception => e
      errors.add(:body, "has a formatting error: #{e.message}")
      false
    end
  end)

  def to_param
    self.slug
  end
  
  def formatted_body
    Formatter.format(self.format, self.body)
  end

  def updated_or_published_at
    updated_at || published_at
  end
  def published?
    published_at
  end
end
