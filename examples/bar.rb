require 'minichart'
include Minichart

plot = BarChart.new
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'bar'