gd2-ffi
=======

gd2-ffi is ruby bindings for gd2, implemented with [FFI][FFI]

  [FFI]: http://kenai.com
  
The bindings are currently very incomplete, only including what I need for a certain project (Creating truecolor images, drawing rectangles, drawing TrueType fonts). 

It follows the same API as the [gd2 gem][GD2-GEM]

  [GD2-GEM]: http://gd2.rubyforge.org/

The reason for building this gem is that the other gd2 gem had problems with segfaulting on some linux boxes, and it was more fun and quicker to learn FFI than debug dlopen (Which I have no idea how it works) :)¨

License
-------

The MIT License

Copyright (c) 2009 Patrik Stenmark

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.