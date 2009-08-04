$: << 'lib'
require 'gd2'

image_height = 100
image_width = 200

options = {
  :offset_x => 1,
  :margin => 10,
  :offset_y => 10, 
  :line_spacing => 2
}
line = "foobar"


font = GD2::Font::TrueType.new(
  "Vera.ttf",
  10.0
)

black = GD2::Color[0.0, 0.0, 0.0]

p1 = GD2::Canvas::Point.new(0,0)
p2 = GD2::Canvas::Point.new(image_width, image_height)
p3 = GD2::Canvas::Point.new(image_width, 0)
p4 = GD2::Canvas::Point.new(image_width * 2, image_height)

bg_rect = GD2::Canvas::FilledRectangle.new(p1, p2)
bg_rect_sprite = GD2::Canvas::FilledRectangle.new(p3, p4)

white = GD2::Color[1.0, 1.0, 1.0]
yellow = GD2::Color[1.0, 0.8, 0.0]

p_text = GD2::Canvas::Point.new(
  options[:offset_x] + options[:margin],
  options[:offset_y] + options[:line_spacing] * (0 + 1))

10.times do |i|
  image = GD2::Image::TrueColor.new(image_width * 2, image_height)
  bg_rect.draw(image, white.to_i)
  bg_rect_sprite.draw(image, yellow.to_i)

  text = GD2::Canvas::Text.new(font, p_text, 0, line)
  begin
    text.draw(image, black)
  rescue => e
    puts e.message
  end


end

GC.start

gets

#File.open("foo.png", "wb") do |file|
#  file.write(image.png)
#end
