require 'minichart'
include Minichart

plot = HorizontalStatusLeds.new [1,1,-1,0,1,1,1,1,1,-1,-1,1], background: '#ccc'
plot.save 'horizontal_status_leds'
