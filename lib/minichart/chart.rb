module Minichart
  class Chart
    attr_accessor :data, :aspect_ratio, :opts

    def initialize(opts={})
      @opts = opts
    end

    def save(name)
      svg.rect x: 0, y: 0, width: width, height: height, fill: '#ccc'
      build
      svg.save name
    end

    def build
      raise "#build should be implemented by subclass."
    end

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

    def width
      @width ||= (aspect_ratio * height).round
    end

    def height
      100
    end

    def svg
      @svg ||= SVG.new viewBox: "0 0 #{width} #{height}", style: style
    end

    def style
      @opts[:style] ||= style!
    end

    def style!
      { background: @opts[:background] || '#eee' }
    end
  end
end
