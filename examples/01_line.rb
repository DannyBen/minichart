require 'rsvp'
include RSVP

plot = LinePlot.new
plot.aspect_ratio = 2
plot.data = [10, 30, 20, 40, 30]
plot.save '01_line'
