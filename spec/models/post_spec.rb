require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Post do
  it "formatted_body should return the formatted body" do
    Post.new(:body => "*Hello*", :format => "markdown").formatted_body.should eql("<p><em>Hello</em></p>")
  end
  it "should validate well formatted body" do
    lambda { Formatter.format(:haml, "- boom!") }.should raise_error
    Post.new(:format => "haml", :body => "- boom!").should_not be_valid(:body)
  end
end
