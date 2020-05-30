require 'minichart'
include Minichart

plot = HorizontalBarMeter.new 70, background: '#9f9', height: 20, width: 240, color: 'green'
plot.save 'horizontal_bar_meter'
