require File.expand_path(File.join(File.dirname(__FILE__), "spec_helper"))

describe GD2::Color do
  it "should initialize from int" do
    GD2::Color.new(50,100,200).rgba.should eql(3302600)
  end
  
  it "should initialize with []" do
    GD2::Color[50,100,200].rgba.should eql(3302600)
  end
  
  it "should have to_i" do
    color = GD2::Color[50,100,200]
    color.rgba.should eql(3302600)
    color.to_i.should eql(color.rgba)
  end
  
  [
    [:red, 50],
    [:green, 100],
    [:blue, 200]
  ].each do |color_name, value|
    it "should return the #{color_name} value" do
      color = GD2::Color[50,100,200]
      color.send(color_name).should eql(value)
    end
    
    it "should return color #{color_name} by first letter" do
      color_name = color_name.to_s[0..0].to_sym
      color = GD2::Color[50,100,200]
      color.send(color_name).should eql(value)
    end
  end
  
  
end