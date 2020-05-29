module Minichart
  # Base class for all Minichart classes
  class Base < Victor::SVG
    attr_reader :aspect_ratio, :background, :color, :data,
      :height, :stroke, :style, :width, :opts

    def initialize(data, opts = {})
      @data = data
      @opts = opts
      @background = opts[:background]
      @aspect_ratio = opts[:aspect_ratio] || 3
      @height = opts[:height] || 100
      @width = opts[:width] || (aspect_ratio * height).round
      @stroke = opts[:stroke] || 2
      @style = opts[:style] || {}
      @color = opts[:color] || '#333'

      super height: height, width: width, style: style, 
        viewBox: "0 0 #{width} #{height}"
      
      rect x: 0, y: 0, width: width, height: height, fill: background if background

      build
    end

    def build
      raise NotImplementedError, "#build is not implemented"
    end
  end
end
