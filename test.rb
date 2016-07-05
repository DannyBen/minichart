require './lib/rsvp'
require 'byebug'

include RSVP

plot = LinePlot.new
plot.aspect_ratio = 2
plot.data = [10, 30, 20, 40, 30]
# p plot.inverted_points
plot.save 'line'


