module RSVP
  class BarPlot < Plot
    def build
      opts  = { x_point_count: data.size }

      inverted_points(opts).each do |x, y|
        svg.rect bar_options x, y
      end
    end

    private

    def style
      @style ||= { stroke_width: 1, stroke: '#eee' }
    end

    def bar_width
      @bar_width ||= width / data.size
    end

    def bar_options(x, y)
      y = y*height
      bar_height = height-y
      { 
        x: x*width, 
        y: y, width: 
        bar_width, height: 
        bar_height, 
        style: style 
      }
    end
  end
end
