require 'minichart'
include Minichart
include Victor

positive = VerticalBarMeter.new 70,
  width: 20, height: 250, background: '#9f9', color: 'green', notches: [0]

negative = VerticalBarMeter.new -80,
  width: 20, height: 250, background: '#f99', color: 'red', notches: [0]

dual = VerticalBarMeter.new 80,
  width: 20, height: 250, background: '#99f', color: 'blue',
  mode: :dual, notches: [0]

svg = SVG.new width: 80, viewBox: "0 0 80 254"
svg.build do
  g(transform: "translate(0) 0")  { append positive }
  g(transform: "translate(28 0)") { append negative }
  g(transform: "translate(56 0)") { append dual }
end

svg.save 'multiple_vertical_bars'

