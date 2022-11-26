require 'minichart'
include Minichart

plot = VerticalStatusLeds.new [1, 1, 1, 1, -1, 1, -1, 1, 0, 1], background: '#ccc'
plot.save 'vertical_status_leds'
