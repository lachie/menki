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

  def self.format(formatter_name, body)
    case formatter_name.to_sym
    when :markdown
      Markdown
    when :textile
      Textile
    when :html
      Html
    end.new(body).to_html
  end
  
  def self.formatters
    formatters = ["html"]
    begin
      require "redcloth"
      formatters << "textile"
    rescue LoadError
    end
    begin
      require "bluecloth"
      formatters << "markdown"
    rescue LoadError
    end
  end
end
