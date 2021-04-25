require 'minichart'
include Minichart

data = (-20..20).to_a
plot = Minichart::HorizontalStatusLeds.new data,
  min_opacity: 0.1, 
  positive_color: 'green',
  negative_color: 'red'

plot.save 'horizontal_led_levels'

