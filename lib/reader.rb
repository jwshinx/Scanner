class Reader
 attr_accessor :string, :input_filename, :results

 def initialize text 
  @string = text 
  @results = [] 
  yield(self) if block_given?
 end

 def find_in_file filename
  @input_filename = filename 
  File.open(input_filename) do |f|
   pattern = Regexp.new(/#{@string}/i)
   while line = f.gets
    @results << line.chomp if line =~ pattern
   end
  end
 end

 def write_output
  File.open("#{path_and_filename}", "w") do |file| 
   if @results.empty?
    file.puts 'No matches found.'
   else
    @results.each { |x| file.puts x } 
   end
  end
 end

 def path_and_filename
  File.expand_path("../outputs/#{output_filename}", File.dirname(__FILE__))
 end

 def matches
  @results
 end

 def output_file_exists?
  File.exists?(path_and_filename)
 end

 def to_s
  "#{string}, #{input_filename}"
 end

 def output_filename
  "#{timestamp}_output.txt"
 end

 def timestamp
  DateTime.now.strftime('%m%d%Y_%k%M%S')
 end

end
