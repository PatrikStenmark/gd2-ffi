module GD2
  class Color
    attr_reader :rgba
    alias :to_i :rgba
    class << self
      alias [] new
    end
    
    def initialize(r, g, b, a = ALPHA_OPAQUE)
      r = self.class.normalize(r, RGB_MAX, :red)
      g = self.class.normalize(g, RGB_MAX, :green)
      b = self.class.normalize(b, RGB_MAX, :blue)
      a = self.class.normalize(a, ALPHA_MAX, :alpha)

      init_with_rgba(self.class.pack(r, g, b, a))
    end
    
    def init_with_rgba(rgba, index = nil, palette = nil)  #:nodoc:
      @rgba = rgba
      @index = index
      @palette = palette
      self
    end
    
    def self.pack(r, g, b, a)   #:nodoc:
      (a << 24) + (r << 16) + (g << 8) + b
    end
    
    def to_s
      s  = 'RGB'
      s += "A" if alpha != ALPHA_OPAQUE
      s += "[#{@index}]" if @index
      s += '#' + [red, green, blue].map { |e| '%02X' % e }.join('')
      s += '%02X' % alpha if alpha != ALPHA_OPAQUE
      s
    end
    
    
    def self.normalize(value, max, component = nil)   #:nodoc:
      case value
      when Integer
        (value < 0) ? 0 : (value > max) ? max : value
      when Float
        normalize((value * max).round, max, component)
      when Color
        value.send(component)
      else
        return normalize(value.to_i, max) if value.respond_to?(:to_i)
        raise TypeError
      end
    end
    # Return the red component of this color (0..RGB_MAX).
    def red
      (rgba & 0xFF0000) >> 16
    end
    alias r red

    # Modify the red component of this color. If this color is associated
    # with a palette entry, this also modifies the palette.
    #def red=(value)
    #  self.rgba = (rgba & ~0xFF0000) |
    #    (self.class.normalize(value, RGB_MAX, :red) << 16)
    #end
    #alias r= red=

    # Return the green component of this color (0..RGB_MAX).
    def green
      (rgba & 0x00FF00) >> 8
    end
    alias g green

    # Modify the green component of this color. If this color is associated
    # with a palette entry, this also modifies the palette.
    #def green=(value)
    #  self.rgba = (rgba & ~0x00FF00) |
    #    (self.class.normalize(value, RGB_MAX, :green) << 8)
    #end
    #alias g= green=

    # Return the blue component of this color (0..RGB_MAX).
    def blue
      rgba & 0x0000FF
    end
    alias b blue

    # Modify the blue component of this color. If this color is associated
    # with a palette entry, this also modifies the palette.
    #def blue=(value)
    #  self.rgba = (rgba & ~0x0000FF) |
    #    self.class.normalize(value, RGB_MAX, :blue)
    #end
    #alias b= blue=

    # Return the alpha component of this color (0..ALPHA_MAX).
    def alpha
      (rgba & 0x7F000000) >> 24
    end
    alias a alpha

    # Modify the alpha component of this color. If this color is associated
    # with a palette entry, this also modifies the palette.
    def alpha=(value)
      self.rgba = (rgba & ~0xFF000000) |
        (self.class.normalize(value, ALPHA_MAX, :alpha) << 24)
    end
    alias a= alpha=
    
    
  end
end