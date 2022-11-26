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
      @bar_width ||= options[:width] / data.size.to_f
    end

    def bar_options(value, i)
      color = if !value || value.zero?
        :neutral_color
      elsif value.positive?
        :positive_color
      else
        :negative_color
      end

      {
        x:      (options[:padding] + (i * bar_width)),
        y:      options[:padding],
        width:  bar_width,
        height: options[:height],
        style:  {
          opacity:      opacity(value),
          fill:         options[color],
          stroke_width: options[:stroke],
          stroke:       options[:background],
        },
      }
    end
  end
end
