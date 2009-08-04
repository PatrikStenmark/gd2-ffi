require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe GD2::Image::TrueColor do
  it "should generate png string" do
    image = GD2::Image::TrueColor.new(100, 100)
    CGD2.should_receive(:gdImagePngPtr).and_return(mock("Pointer"))
    
    image.png
  end
end
