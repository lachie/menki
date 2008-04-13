require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Formatter do
  it "should list all the formatters" do
    Formatter.formatters.sort.should eql(%w(markdown textile html).sort)
  end
  it "should format Markdown" do
    Formatter.format(:markdown, "*Hello*").should eql("<p><em>Hello</em></p>")
  end
  it "should format Textile" do
    Formatter.format(:textile, "*Hello*").should eql("<p><strong>Hello</strong></p>")
  end
  it "should format HTML" do
    Formatter.format(:html, "*<strong>Hello</strong>*").should eql("*<strong>Hello</strong>*")
  end
end
