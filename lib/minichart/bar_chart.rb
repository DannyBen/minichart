module Minichart
  class BarChart < Chart
    def build
      opts  = { x_point_count: data.size }

      inverted_points(opts).each do |x, y|
        rect bar_options x, y
      end
    end

  protected

    def bar_width
      @bar_width ||= width / data.size
    end

    def bar_options(x, y)
      y = y*height
      bar_height = height-y
      { 
        x: x*width, 
        y: y, 
        width: bar_width, 
        height: bar_height, 
        style: { fill: color, stroke_width: stroke, stroke: background }
      }
    end
  end
end
