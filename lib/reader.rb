class Reader
 attr_accessor :string, :filename, :file
 def initialize text 
  @string = text 
  @file = yield(self) if block_given?
 end
 def set_file filename
  @filename = filename 
  File.open(filename) do |f|
   puts "---> set_file block"
  end
 end
 def to_s
  "#{string}, #{filename}"
 end
end
