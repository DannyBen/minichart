module Minichart
  # Base class for led charts
  class Leds < Base

    class << self
      def leds_defaults
        @meter_defaults ||= {
          positive_color: '#6f6',
          negative_color: '#f66',
          neutral_color: '#eee',
          padding: 2,
        }
      end
    end

  end
end
