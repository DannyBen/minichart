require 'minichart'
include Minichart
include Victor

positive = HorizontalBarMeter.new 70,
  height: 20, width: 250, background: '#9f9', color: 'green', notches: [0]

negative = HorizontalBarMeter.new(-80,
  height: 20, width: 250, background: '#f99', color: 'red', notches: [0])

dual = HorizontalBarMeter.new 80,
  height: 20, width: 250, background: '#99f', color: 'blue',
  mode: :dual, notches: [0]

svg = SVG.new width: 254, viewBox: '0 0 254 80'
svg.build do
  g(transform: 'translate(0 0)')  { append positive }
  g(transform: 'translate(0 28)') { append negative }
  g(transform: 'translate(0 56)') { append dual }
end

svg.save 'multiple_horizontal_bars'
