class Reader
 attr_accessor :string, :filename, :results

 def initialize text 
  @string = text 
  @results = [] 
  yield(self) if block_given?
 end

 def find_in_file filename
  @filename = filename 
  File.open(filename) do |f|
   pattern = Regexp.new(/#{@string}/i)
   while line = f.gets
    @results << line.chomp if line =~ pattern
   end
  end
 end

 def matches
  @results
 end

 def to_s
  "#{string}, #{filename}"
 end

 def timestamp
  DateTime.now.strftime('%m%d%Y_%k%M%S')
 end

end
