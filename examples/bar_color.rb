require 'minichart'
include Minichart

data = [10, 30, 20, 40, 30]
plot = BarChart.new data, background: '#fda', color: 'blue'
plot.save 'bar_color'
