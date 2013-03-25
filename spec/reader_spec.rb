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
 
  it "should know timestamp" do
   @reader = Reader.new( 'two' ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
   today = DateTime.now.strftime('%m%d%Y')
   @reader.timestamp.should =~ Regexp.new(/#{today}/)
  end

  it "should return one hit" do
   @reader = Reader.new( 'two' ) do |r|
    r.find_in_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
   end
   @reader.matches.include?('two').should be_true 
  end
 end
 
 describe "outputs" do
  it "should get time" do
   now = DateTime.now
   puts "---> now: #{now.strftime('%m%d%Y_%k%M%S')}"
  end 
 end

 describe "for fun" do
  it "one" do
   puts "---> file dirname: #{File.dirname(__FILE__)}"
   puts "---> this file: #{__FILE__} - #{__FILE__.class}"
   puts "---> expand: #{File.expand_path(File.dirname(__FILE__))}"
   puts "---> myfile: #{File.expand_path('../lib/name.txt', File.dirname(__FILE__))}"
   namefile = File.expand_path('../lib/name.txt', File.dirname(__FILE__))
   File.open(namefile, "r") do |file|
    while line = file.gets 
     puts "---> line: #{line}"
    end
   end
  end
 end
end

