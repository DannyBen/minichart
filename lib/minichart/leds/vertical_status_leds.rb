module Minichart
  class VerticalStatusLeds < Leds
    class << self
      def defaults
        leds_defaults.merge width: 50, height: 300
      end
    end

    def build
      data.each_with_index do |value, i|
        element :rect, bar_options(value, i)
      end
    end

  protected

    def points
      @points ||= data.size
    end

    def bar_height
      @bar_height ||= options[:height] / points
    end

    def bar_options(value, i)
      y = options[:padding] + (points - i - 1) * bar_height
      color = value > 0 ? :positive_color : value < 0 ? :negative_color : :neutral_color
      { 
        x: options[:padding],
        y: y,
        width: options[:width],
        height: bar_height,
        style: {
          fill: options[color],
          stroke_width: options[:stroke],
          stroke: options[:background]
        }
      }
    end
  end
end
