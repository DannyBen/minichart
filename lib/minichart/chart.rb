module Minichart
  class Chart < Victor::SVG
    attr_reader :aspect_ratio, :background, :color, :data,
      :height, :stroke, :style, :width

    def initialize(data, opts = {})
      @data = data
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

  protected

    def inverted_points(opts={})
      normalized_points(opts).map { |point| [point[0], 1-point[1]] }
    end

    def normalized_points(opts={})
      x_point_count = opts[:x_point_count] || data.count-1

      range   = (data.max - data.min).to_f
      x_width = 1/(x_point_count).to_f
      result  = []

      data.each_with_index do |y, index|
        x = index*x_width
        y = (y-data.min)/range
        result << [x,y]
      end

      result
    end
  end
end
