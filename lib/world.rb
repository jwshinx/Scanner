module World
 #shared_examples_for 'validity is true' do |object|
 shared_examples_for 'validity is true' do
  it "returns true" do
   @fido.valid?.should be_true
  end
 end
 shared_examples_for 'validity is false' do
  it "returns false" do
   @fido.valid?.should be_false
  end
 end
end
