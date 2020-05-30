require 'minichart'
include Minichart

data = [10, 30, 20, 40, 30]
plot = LineChart.new data, background: '#eee', height: 50, width: 250, color: 'green'
plot.save 'line_chart'

