module Minichart
  class HorizontalBarMeter < Meter
    def build
      draw_bar
      draw_zero_line if zero_line
      draw_clipping_indicator if clipping_indicator and clipping?
    end

  protected

    def draw_clipping_indicator
      x = if mode == :positive or (mode == :dual and value > 0)
        width - clipping_indicator_size
      else
        0
      end

      element :rect, x: x, y: 0,
        height: height, width: clipping_indicator_size,
        fill: clipping_indicator_color

    end

    def draw_bar
      x = if mode == :negative
        width - bar_width
      elsif mode == :dual
        middle = width * 0.5
        value >= 0 ? middle : middle - bar_width
      else
        0
      end

      element :rect, x: x, y: 0, height: height, width: bar_width, style: style
    end

    def draw_zero_line
      x = if mode == :negative
        width - zero_line_size
      elsif mode == :dual
        width / 2 - zero_line_size / 2
      else
        0
      end

      element :rect, x: x, y: 0,
        height: height, width: zero_line_size,
        fill: zero_line_color

    end

    def clipping?
      value > max || value < -max
    end

    def mode
      @mode ||= mode!
    end

    def mode!
      opts[:mode] ||= :auto

      if opts[:mode] == :auto
        value >= 0 ? :positive : :negative
      else
        opts[:mode].to_sym
      end
    end

    def max
      opts[:max] ||= 100
    end

    def zero_line
      opts[:zero_line]
    end

    def zero_line_size
      opts[:zero_line_size] ||= 6
    end

    def zero_line_color
      opts[:zero_line_color] ||= 'black'
    end

    def clipping_indicator
      opts[:clipping_indicator]
    end

    def clipping_indicator_size
      opts[:clipping_indicator_size] ||= 6
    end

    def clipping_indicator_color
      opts[:clipping_indicator_color] ||= 'yellow'
    end

    def width_factor
      width / max.to_f
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
