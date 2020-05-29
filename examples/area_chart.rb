require 'minichart'
include Minichart

data = [10, 30, 20, 40, 30]
plot = AreaChart.new data, height: 50, background: '#eee', aspect_ratio: 5, color: 'green'
plot.save 'area_chart'

