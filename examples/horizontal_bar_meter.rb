require 'minichart'
include Minichart

plot = HorizontalBarMeter.new 70, height: 20, background: '#9f9', aspect_ratio: 12, color: 'green'
plot.save 'horizontal_bar_meter'
