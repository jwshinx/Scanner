require 'spec_helper'
require 'world'

describe "Reader" do
 include World

 describe "when grepping '/two/i' in file numbers.txt" do
  before do 
   @reader = Reader.new( '/two/i' ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
  end

  it "should display grep-string and path-and-filename" do
   @reader.to_s.should == '/two/i, /Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt'
  end
 
  it "should know timestamp" do
   @reader.timestamp.should =~ Regexp.new(/#{DateTime.now.strftime('%m%d%Y')}/)
  end

  it "should write output file" do
   @reader.write_output
   @reader.output_file_exists?.should be_true
  end
 end

 describe "when grepping '/t.*wo/i' in file numbers.txt" do
  before do 
   @r = Reader.new( "/t.*wo/i" ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
  end

  describe "matches" do 
   it "should return *two*" do
    @r.matches.include?('two').should be_true 
   end
 
   it "should return *tWo*" do
    @r.matches.include?('tWo').should be_true 
   end
 
   it "should return *taaawo*" do
    @r.matches.include?('taaawo').should be_true 
   end
  end
 end
end
 
