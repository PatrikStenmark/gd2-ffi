module GD2
  class Canvas
    class Point
      attr_accessor :x, :y
      def initialize(x, y)
        @x, @y = x, y
      end
    end
    
    class Text
      def initialize(font, point, angle, string)
        @font, @point, @angle, @string = font, point, angle, string
      end
      
      def draw(image, color)
        @font.draw(image.image_ptr, @point.x, @point.y, @angle, @string, color.rgba)
      end
    end
    
    class FilledRectangle
      def initialize(point1, point2)
        @p1, @p2 = point1, point2
      end

      def draw(image, color)
        color = color.is_a?(GD2::Color) ? color.rgba : color
        
        CGD2::gdImageFilledRectangle(image.image_ptr, @p1.x, @p1.y, @p2.x, @p2.y, color)
        nil
      end
    end
  end
end