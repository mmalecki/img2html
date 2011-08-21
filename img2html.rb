require 'RMagick'

img = Magick::Image::read(ARGV[0]).first
content = ""
img.each_pixel { |pixel, c, r|
  red = (pixel.red * 255) / Magick::QuantumRange
  green = (pixel.green * 255) / Magick::QuantumRange
  blue = (pixel.blue * 255) / Magick::QuantumRange 
  content << "<div style='background-color: rgb(#{red}, #{green}, #{blue})'></div>"
}

puts """
<!doctype html>
<html>
  <head>
    <title>#{ARGV[0]}</title>
    <style>
      .i {
        width: #{img.columns}px;
        height: #{img.rows}px;
      }

      .i div {
        float: left;
        width: 1px;
        height: 1px;
      }
    </style>
  </head>
  <body>
    <div class='i'>
      #{content}
    </div>
  </body>
</html>
"""

