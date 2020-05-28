require 'minichart'
require 'victor'
include Minichart
include Victor

def random_data(size)
  Array.new(size) { |i| rand i..(i + i * 10) }
end

linechart = LineChart.new color: 'green'
linechart.data = random_data 20

barchart = BarChart.new color: 'blue'
barchart.data = random_data 40

areachart = AreaChart.new color: 'red'
areachart.data = random_data 20

svg = SVG.new
svg.build do
  g(transform: "translate(0 0)")  { append linechart.render }
  g(transform: "translate(310 0)") { append barchart.render }
  g(transform: "translate(620 0)")  { append areachart.render }
end

svg.save 'multiple'
