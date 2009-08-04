module GD2
  class Image
    attr_reader :image_ptr
    
    
  end
  
  class Image::IndexedColor < Image
    
  end
  
  class Image::TrueColor < Image
    def initialize(w, h)
      @image_ptr = CGD2::gdImageCreate(w, h)
    end
  end
end