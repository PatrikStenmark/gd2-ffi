module GD2
  class Font
    class TrueType
      
      class FreeTypeError < StandardError ; end
      def initialize(fontname, ptsize, options = {})
        @fontname, @ptsize = fontname, ptsize
        
        # since no start of cache, no register!
        # do the font path getting?
      end
      
      def draw(image_ptr, x, y, angle, string, fg)
        brect = FFI::MemoryPointer.new(:int, 8)
        string.gsub!('&', '&amp;')
        error = CGD2::gdImageStringFT(image_ptr, brect, fg, @fontname, @ptsize, angle.to_f, x, y, string)
        
        
        raise FreeTypeError, error unless error.null?
        
        brect = brect.read_array_of_int(8)
        
        { :lower_left   => [brect[0], brect[1]],
          :lower_right  => [brect[2], brect[3]],
          :upper_right  => [brect[4], brect[5]],
          :upper_left   => [brect[6], brect[7]]
          #:position     => position
        }
        
      end
      
      # Return a hash describing the rectangle that would enclose the given
      # string rendered in this font at the given angle. The returned hash
      # contains the following keys:
      #
      # - :lower_left => The [x, y] coordinates of the lower left corner.
      # - :lower_right => The [x, y] coordinates of the lower right corner.
      # - :upper_right => The [x, y] coordinates of the upper right corner.
      # - :upper_left => The [x, y] coordinates of the upper left corner.
      # - :position => An array of floating point character position offsets for
      #   each character of the +string+, beginning with 0.0. The array also
      #   includes a final position indicating where the last character ends.
      #
      # The _upper_, _lower_, _left_, and _right_ references are relative to the
      # text of the +string+, regardless of the +angle+.
      def bounding_rectangle(string, angle = 0.0)
        data = draw(nil, 0, 0, angle, string, 0)

        #if string.length == 1
        #  # gd annoyingly fails to provide xshow data for strings of length 1
        #  position = draw(nil, 0, 0, angle, string + ' ', 0)[:position]
        #  data[:position] = position[0...-1]
        #end

        data
      end
      
    end
    
  end
end

#def draw(image_ptr, x, y, angle, string, fg)  #:nodoc:
#  brect = Array.new(8) { 0 }
#  strex = strex(true)
#  r, rs = SYM[:gdImageStringFTEx].call(image_ptr,
#    brect, fg, @fontname, @ptsize, angle.to_f, x, y,
#    string.gsub('&', '&amp;'), strex)
#  raise FreeTypeError, r if r
#
#  brect = rs[1].to_a('I', 8)
#
#  if xshow = strex[:xshow]
#    xshow.free = SYM[:gdFree]
#    xshow = xshow.to_s.split(' ').map { |e| e.to_f }
#  else
#    xshow = []
#  end
#
#  sum = 0.0
#  position = Array.new(xshow.length + 1)
#  xshow.each_with_index do |advance, i|
#    position[i] = sum
#    sum += advance
#  end
#  position[-1] = sum
#
#  { :lower_left   => [brect[0], brect[1]],
#    :lower_right  => [brect[2], brect[3]],
#    :upper_right  => [brect[4], brect[5]],
#    :upper_left   => [brect[6], brect[7]],
#    :position     => position
#  }
#end
#