require 'minichart'
include Minichart

data = [10, 30, 20, 40, 30]
plot = BarChart.new data, aspect_ratio: 3
plot.save 'bar'
