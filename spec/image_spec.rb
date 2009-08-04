require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe GD2::Image::TrueColor do
  before do
    CGD2.stub!(:gdFree)
  end
  it "should generate png string" do
    image = GD2::Image::TrueColor.new(100, 100)
    CGD2.should_receive(:gdImagePngPtr).and_return(mock("Pointer", :get_bytes => ''))
    
    image.png
  end
end
