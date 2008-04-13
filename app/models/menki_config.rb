require 'ostruct'

# Taken from:
# http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/285416
class NestedOstruct
   def self.new(hash)
     OpenStruct.new(hash.inject({}){|r,p| r[p[0]] = p[1].kind_of?(Hash) ?
NestedOstruct.new(p[1]) : p[1]; r })
   end
end

::MenkiConfig = NestedOstruct.new(YAML.load_file(Merb.root / "config" / "menki.yml"))
