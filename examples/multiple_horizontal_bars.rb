require 'minichart'
include Minichart
include Victor

positive = HorizontalBarMeter.new 70,
  height: 20, width: 250, background: '#9f9', color: 'green'

negative = HorizontalBarMeter.new -80,
  height: 20, width: 250, background: '#f99', color: 'red'

dual = HorizontalBarMeter.new 80,
  height: 20, width: 250, background: '#99f', color: 'blue',
  mode: :dual, zero_line: true

svg = SVG.new width: 250, viewBox: "0 0 250 70"
svg.build do
  g(transform: "translate(0 0)")  { append positive }
  g(transform: "translate(0 25)") { append negative }
  g(transform: "translate(0 50)") { append dual }
end

svg.save 'multiple_horizontal_bars'
