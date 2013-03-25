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
end

=begin
 describe "fido" do
  before { @fido = FactoryGirl.build(:fido) }
  subject { @fido }
  it { should be_valid }
  its(:name) { should == 'fido' }
  its(:breed) { should == :beagle }
  its(:gender) { should == :male }
  it_should_behave_like 'validity is true'

  describe "name via *send('name')*" do
   it "returns 'fido'" do
    @fido.send('name').should == 'fido'
   end
  end
  describe "name via 'send(:name)'" do
   it "returns 'fido'" do
    @fido.send(:name).should == 'fido'
   end
  end
  describe "name via instance-variable-get" do
   it "returns 'fido'" do
    @fido.instance_variable_get(:@name).should == 'fido'
   end
  end
 end

 describe Dog do
  shared_examples_for "a male dog object" do
   subject { dog }
   its(:gender) { should == :male }
  end
  
  it_should_behave_like "a male dog object" do
   let(:dog) { described_class.new 'nico', :terrier, :male }
   its(:breed) { should == :terrier }
   its(:name) { should == 'nico' }
  end
  it_should_behave_like "a male dog object" do
   let(:dog) { described_class.new 'henry', :pug, :male }
   its(:breed) { should == :pug }
   its(:name) { should == 'henry' }
  end
 end
=end

