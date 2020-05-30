module Minichart
  class BarChart < Chart
    def build
      opts  = { x_point_count: data.size }

      inverted_points(opts).each do |x, y|
        element :rect, bar_options(x, y)
      end
    end

  protected

    def bar_width
      @bar_width ||= options[:width] / data.size
    end

    def bar_options(x, y)
      y = y * options[:height]
      bar_height = options[:height] - y
      { 
        x: x * options[:width], 
        y: y, 
        width: bar_width,
        height: bar_height,
        style: {
          fill: options[:color],
          stroke_width: options[:stroke],
          stroke: options[:background]
        }
      }
    end
  end
end
