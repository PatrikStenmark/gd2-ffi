module GD2
  class Image
    attr_reader :image_ptr
    
    
  end
  
  class Image::IndexedColor < Image
    
  end
  
  class Image::TrueColor < Image
    def initialize(w, h)
      @image_ptr = CGD2::gdImageCreateTrueColor(w, h)
    end
    
    def png
      size = FFI::MemoryPointer.new(:pointer)
      png_pointer = CGD2.gdImagePngPtr(@image_ptr, size)
      
      size = size.get_int(0)
      
      png_pointer.get_bytes(0, size)
    end
  end
end