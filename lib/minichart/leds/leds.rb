module Minichart
  # Base class for led charts
  class Leds < Base
    class << self
      def leds_defaults
        @meter_defaults ||= {
          positive_color: '#6f6',
          negative_color: '#f66',
          neutral_color: '#eee',
          min_opacity: 1,
          padding: 2,
        }
      end
    end

  protected

    # Returns opacity level for a given value
    def opacity(value)
      return 1 if !value or value == 0
      value.abs * ((1 - options[:min_opacity]) / max) + options[:min_opacity]
    end

    # Returns the absolute highest or loest value.
    # Used to define the availble range of values
    def max
      @max ||= [data.compact.max, data.compact.min.abs].max.to_f
    end

  end
end
