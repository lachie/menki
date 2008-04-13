%w(redcloth bluecloth).each do |gem|
  begin
    require gem
  rescue LoadError
  end
end

class Formatter
  class Markdown
    def initialize(body)
      @body = body
    end
    def to_html
      BlueCloth.new(@body).to_html
    end
  end
  class Textile
    def initialize(body)
      @body = body
    end
    def to_html
      RedCloth.new(@body).to_html(:textile)
    end
  end
  class Html
    def initialize(body)
      @body = body
    end
    def to_html
      @body
    end
  end

  def self.format(format, text)
    case format.to_sym
    when :markdown
      Markdown
    when :textile
      Textile
    when :html
      Html
    end.new(text).to_html
  end
  
  def self.formatters
    formatters = ["html"]
    formatters << "textile" if defined?(RedCloth)
    formatters << "markdown" if defined?(BlueCloth)
    formatters
  end
end