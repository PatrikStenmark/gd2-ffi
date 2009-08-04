require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe "Canvas" do
  before do
    @image = GD2::Image::TrueColor.new(100, 100)
    @black = GD2::Color[0,0,0]
  end
  
  describe "FilledRectangle" do
    it "should intitialze by two gd points" do
      p1 = GD2::Canvas::Point.new(0,0)
      p2 = GD2::Canvas::Point.new(10,10)
      GD2::Canvas::FilledRectangle.new(p1, p2)
    end
    
    it "should call GD draw function" do
      CGD2.should_receive(:gdImageFilledRectangle).with(anything, 0, 0, 10, 10, 0)
      p1 = GD2::Canvas::Point.new(0,0)
      p2 = GD2::Canvas::Point.new(10,10)
      
      rect = GD2::Canvas::FilledRectangle.new(p1, p2)
      
      rect.draw(@image, @black.to_i)
    end
    
    it "should convert Color to int" do
      CGD2.should_receive(:gdImageFilledRectangle).with(anything, 0, 0, 10, 10, 0)
      p1 = GD2::Canvas::Point.new(0,0)
      p2 = GD2::Canvas::Point.new(10,10)
      
      rect = GD2::Canvas::FilledRectangle.new(p1, p2)
      
      rect.draw(@image, @black)
    end
  end
  
  describe "TrueType" do
    it "should find out the font path"
    
    it "should call C function on draw" do
      font = GD2::Font::TrueType.new(
        "Vera.ttf",
        10.0
      )
      
      p_text = GD2::Canvas::Point.new(1,2)
      
      
      CGD2.should_receive(:gdImageStringFT).with(anything, anything, @black.to_i, "Vera.ttf", 10.0, 0.0, 1, 2, "foobar")
      
      text = GD2::Canvas::Text.new(font, p_text, 0, "foobar")
      text.draw(@image, @black)
    end
  end
end