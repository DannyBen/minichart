require 'minichart'
include Minichart

data = [10, 30, 20, 40, 30]
plot = LineChart.new data, height: 50, background: '#eee', aspect_ratio: 5, color: 'green'
plot.save 'line_chart'

