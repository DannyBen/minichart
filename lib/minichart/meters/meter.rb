module Minichart
  # Base class for charts with a single value
  class Meter < Base

  protected 

    def value
      data
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

    def style
      { fill: color, stroke_width: stroke, stroke: background }
    end

  end
end
