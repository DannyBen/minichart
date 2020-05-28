module Minichart
  class Chart
    attr_accessor :data, :aspect_ratio, :opts

    def initialize(opts={})
      @opts = opts
      @aspect_ratio = 3
    end

    def save(name)
      svg.rect x: 0, y: 0, width: width, height: height, fill: background
      build
      svg.save name
    end

    def render
      svg.rect x: 0, y: 0, width: width, height: height, fill: background
      build
      svg.to_s
    end

    def build
      raise NotImplementedError, "#build is not implemented"
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

    def height
      100
    end

    def style
      @opts[:style] ||= {}
    end

    def background
      @opts[:background] ||= '#eee'
    end

    def color
      @opts[:color] || '#333'
    end

    def stroke
      @opts[:stroke] ||= 2
    end

    def width
      @width ||= (aspect_ratio * height).round
    end

    def svg
      @svg ||= Victor::SVG.new viewBox: "0 0 #{width} #{height}", style: style
    end
  end
end
