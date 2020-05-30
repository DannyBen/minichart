module Minichart
  # Base class for charts with a single value
  class Meter < Base

  protected 

    def value
      data
    end

    def clipping?
      value > options[:max] || value < -options[:max]
    end

    def mode
      @mode ||= mode!
    end

    def mode!
      options[:mode] ||= :auto

      if options[:mode] == :auto
        value >= 0 ? :positive : :negative
      else
        options[:mode].to_sym
      end
    end

    def meter_defaults
      {
        height: 50,
        max: 100,
        notches: [],
        notch_thickness: 10,
        notch_color: 'black',
        clipping_indicator: false,
        clipping_indicator_thickness: 20,
        clipping_indicator_color: 'yellow',
      }
    end

    def clamped_value
      case mode
      when :positive
        value.clamp 0, options[:max]
      when :negative
        value.clamp -options[:max], 0
      when :dual
        value.clamp -options[:max], options[:max]
      end
    end

    def style
      {
        fill: options[:color],
        stroke_width: options[:stroke],
        stroke: options[:background]
      }
    end

  end
end
