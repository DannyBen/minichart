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

meter = HorizontalBarMeter.new 80, mode: :dual, 
  background: '#ccd', color: 'green', notches: [0],
  height: 20, width: 490

leds = HorizontalStatusLeds.new (-10..10).to_a,
  height: 20, width: 480, min_opacity: 0.5,
  positive_color: 'green', negative_color: 'red',
  background: '#ccd'

svg = SVG.new viewBox: "0 0 980 120"
svg.build do
  g(transform: "translate(0 0)")  { append linechart }
  g(transform: "translate(330 0)") { append barchart }
  g(transform: "translate(660 0)")  { append areachart }
  
  g(transform: "translate(0 90)")  { append meter }
  g(transform: "translate(500 90)")  { append leds }
end

svg.save 'multiple'

