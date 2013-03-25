require 'spec_helper'
require 'world'

describe "Reader" do
 include World

 describe "when grepping *two* in file numbers.txt" do
  before do 
   @reader = Reader.new( 'two' ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
  end

  it "should display grep-string and path-and-filename" do
   @reader.to_s.should == 'two, /Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt'
  end
 
  it "should know timestamp" do
   @reader.timestamp.should =~ Regexp.new(/#{DateTime.now.strftime('%m%d%Y')}/)
  end

  it "should return one hit" do
   @reader.matches.include?('two').should be_true 
  end

  it "should write output file" do
   @reader.write_output
   @reader.output_file_exists?.should be_true
  end
 end
 

end

