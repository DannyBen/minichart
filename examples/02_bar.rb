require 'minichart'
include Minichart

plot = BarChart.new
plot.aspect_ratio = 2
plot.data = [10, 30, 20, 40, 30]
plot.save '02_bar'
