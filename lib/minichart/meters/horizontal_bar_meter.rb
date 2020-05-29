module Minichart
  class HorizontalBarMeter < Meter
    def build
      x = if mode == :negative
        x = width - bar_width
      elsif mode == :dual
        middle = width * 0.5
        x = value >= 0 ? middle : middle - bar_width
      else
        0
      end

      draw_bar x
    end

  protected

    def draw_bar(x)
      rect x: x, y: 0, height: height, width: bar_width, style: style
    end

    def mode
      if opts[:mode] == :auto
        value >= 0 ? :positive : :negative
      else
        opts[:mode] || :positive
      end
    end

    def max
      opts[:max] ||= 100
    end

    def width_factor
      width / max
    end

    def clamped_value
      case mode
      when :positive
        value.clamp 0, max
      when :negative
        value.clamp -max, 0
      when :dual
        value.clamp -max, max
      end
    end

    def bar_width
      if mode == :dual
        clamped_value.abs * width_factor * 0.5
      else
        clamped_value.abs * width_factor
      end
    end

    def style
      { fill: color, stroke_width: stroke, stroke: background }
    end
  end
end


