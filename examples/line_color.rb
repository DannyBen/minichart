require 'minichart'
include Minichart

data = [10, 30, 20, 40, 30]
plot = LineChart.new data, background: '#fda', color: 'blue'
plot.save 'line_color'
