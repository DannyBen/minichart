module Minichart
  class VerticalBarMeter < Meter
    class << self
      def defaults
        meter_defaults.merge width: 50, height: 300
      end
    end

    def build
      draw_bar
      draw_notches if options[:notches]
      draw_clipping_indicator if options[:clipping_indicator] && clipping?
    end

  protected

    def draw_bar
      y1 = y_for 0
      y2 = y_for clamped_value
      y = [y1, y2].min

      element :rect, x: options[:padding], y: y, height: bar_height,
        width: options[:width], style: style
    end

    def draw_notches
      options[:notches].each do |notch|
        draw_notch notch
        draw_notch(-notch) if (mode == :dual) && (notch != 0)
      end
    end

    def draw_notch(notch)
      draw_horizontal_line notch, stroke: options[:notch_thickness],
        color: options[:notch_color]
    end

    def draw_clipping_indicator
      draw_horizontal_line clamped_value,
        stroke: options[:clipping_indicator_thickness],
        color:  options[:clipping_indicator_color]
    end

    def draw_horizontal_line(target_value, color:, stroke:)
      y = y_for target_value

      element :line, x1: options[:padding], x2: options[:width] + options[:padding],
        y1: y, y2: y,
        stroke: color, stroke_width: stroke
    end

    def height_factor
      options[:height] / options[:max].to_f
    end

    def half_height
      options[:height] * 0.5
    end

    def bar_height
      if mode == :dual
        clamped_value.abs * height_factor * 0.5
      else
        clamped_value.abs * height_factor
      end
    end

    def y_for(target_value)
      result = (target_value.abs / options[:max].to_f * options[:height]) + options[:padding]

      case mode
      when :positive
        full_height - result
      when :negative
        result
      when :dual
        options[:height] - ((target_value / options[:max].to_f * half_height) + half_height) + options[:padding]
      end
    end
  end
end
