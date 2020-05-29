require 'minichart'
require 'victor'
include Minichart
include Victor

def random_data(size)
  srand 1000
  Array.new(size) { |i| rand i..(i + i * 10) }
end

options = { height: 60, width: 300, background: '#ccd' }

linechart = LineChart.new random_data(20), options.merge({ color: 'green' })
barchart  = BarChart.new  random_data(40), options.merge({ color: 'blue' })
areachart = AreaChart.new random_data(20), options.merge({ color: 'red' })

svg = SVG.new viewBox: "0 0 920 60"
svg.build do
  g(transform: "translate(0 0)")  { append linechart }
  g(transform: "translate(310 0)") { append barchart }
  g(transform: "translate(620 0)")  { append areachart }
end

svg.save 'multiple'
