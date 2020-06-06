module Minichart
  class HorizontalStatusLeds < Leds
    class << self
      def defaults
        leds_defaults.merge width: 300, height: 50
      end
    end

    def build
      data.each_with_index do |value, i|
        element :rect, bar_options(value, i)
      end
    end

  protected

    def bar_width
      @bar_width ||= options[:width] / data.size
    end

    def bar_options(value, i)
      color = value > 0 ? :positive_color : value < 0 ? :negative_color : :neutral_color
      { 
        x: (options[:padding] + i * bar_width),
        y: options[:padding], 
        width: bar_width,
        height: options[:height],
        style: {
          fill: options[color],
          stroke_width: options[:stroke],
          stroke: options[:background]
        }
      }
    end
  end
end
