module GD2
  class Image
    attr_reader :image_ptr
    
    
  end
  
  class Image::IndexedColor < Image
    
  end
  
  class Image::TrueColor < Image
    def release(ptr)
      CGD2::gdImageDestroy(ptr)
    end
    def initialize(w, h)
      @image_ptr = FFI::AutoPointer.new(
        CGD2::gdImageCreateTrueColor(w, h), 
        self.method(:release)
      )
    end
    
    def png
      size = FFI::MemoryPointer.new(:pointer)
      png_pointer = CGD2.gdImagePngPtr(@image_ptr, size)
      
      size = size.get_int(0)
      
      png = png_pointer.get_bytes(0, size)
      
      CGD2::gdFree(png_pointer)
      
      png
    end
  end
end