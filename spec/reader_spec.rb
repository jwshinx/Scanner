require 'spec_helper'
require 'world'

describe "Reader" do
 include World

 it "bbb" do
  File.open("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") do |file| 
   puts ""
   while line = file.gets
    puts "---> #{line}"
   end
  end
 end

 it "ddd" do
  @reader = Reader.new( 'two' ) do |r|
   r.set_file("/Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt") 
  end
  @reader.to_s.should == 'two, /Users/joelshin/Documents/testing/FileScanner/lib/numbers.txt'
 end
end

