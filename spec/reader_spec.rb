require 'spec_helper'
require 'world'

describe "Reader" do
 include World

 describe "when grepping *two* in file numbers.txt" do
  it "should display grep-string and path-and-filename" do
   @reader = Reader.new( 'two' ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
   @reader.to_s.should == 'two, /Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt'
  end
 
  it "should return one hit" do
   @reader = Reader.new( 'two' ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
   @reader.matches.include?('two').should be_true 
  end
 end
end
 
