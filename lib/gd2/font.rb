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