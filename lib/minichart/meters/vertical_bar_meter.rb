module Minichart
  class VerticalBarMeter < Meter
    def build
      if inverse?
        rect x: width - bar_width, y: 0, height: height, width: bar_width, style: style
      else
        rect x: 0, y: 0, height: height, width: bar_width, style: style
      end
    end

  protected

    def max_value
      opts[:max_value] ||= (inverse? ? 0 : 100)
    end

    def min_value
      opts[:min_value] ||= (inverse? ? -100 : 0)
    end

    def inverse?
      opts[:inverse]
    end

    def width_factor
      @width_factor ||= width / (inverse? ? min_value.abs.to_f : max_value.to_f )
    end

    def clamped_value
      @clamped_value ||= value.clamp(min_value, max_value)
    end

    def bar_width
      @bar_width ||= clamped_value.abs * width_factor
    end

    def style
      { fill: color, stroke_width: stroke, stroke: background }
    end
  end
end
