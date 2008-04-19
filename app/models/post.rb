class Post < DataMapper::Base
  property :slug, :string, :index => true
  property :body, :text
  property :title, :string
  property :published_at, :datetime, :index => true
  property :updated_at, :datetime
  property :format, :string

  validates_presence_of :slug, :body, :title, :if => Proc.new { published? }

  validates_true_for :body,
                     :logic => Proc.new { formatted_body != FORMATTING_ERROR },
                     :if => Proc.new { published? }

  validates_true_for :format, :logic => (Proc.new do 
    unless (formatters = Formatter.formatters).include?(format)
      errors.add(:format, "not one of: #{formatters.join(", ")}")
      false
    else
      true
    end
  end), :if => Proc.new { published? }

  def to_param
    self.slug
  end
  
  def formatted_body
    Formatter.format(self.format, self.body) rescue "Error formatting body"
  end

  def updated_or_published_at
    updated_at || published_at
  end
  def published?
    published_at
  end
  def draft?
    !published?
  end
end