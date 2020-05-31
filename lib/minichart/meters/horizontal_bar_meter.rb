module Minichart
  class HorizontalBarMeter < Meter
    class << self
      def defaults
        meter_defaults.merge width: 300, height: 50
      end
    end

    def build
      draw_bar
      draw_notches if options[:notches]
      draw_clipping_indicator if options[:clipping_indicator] and clipping?
    end

  protected

    def draw_bar
      x1 = x_for 0
      x2 = x_for clamped_value
      x = [x1, x2].min

      element :rect, x: x, y: options[:padding], height: options[:height],
        width: bar_width, style: style
    end

    def draw_notches
      options[:notches].each do |notch|
        draw_notch notch
        draw_notch -notch if mode == :dual and notch != 0
      end
    end

    def draw_notch(notch)
      draw_vertical_line notch, stroke: options[:notch_thickness],
        color: options[:notch_color]
    end

    def draw_clipping_indicator
      draw_vertical_line clamped_value,
        stroke: options[:clipping_indicator_thickness],
        color: options[:clipping_indicator_color]
    end

    def draw_vertical_line(target_value, color:, stroke:)
      x = x_for target_value

      element :line, x1: x, x2: x,
        y1: options[:padding], y2: options[:height] + options[:padding],
        stroke: color, stroke_width: stroke
    end

    def width_factor
      options[:width] / options[:max].to_f
    end

    def half_width
      options[:width] * 0.5
    end

    def bar_width
      if mode == :dual
        clamped_value.abs * width_factor * 0.5
      else
        clamped_value.abs * width_factor
      end
    end

    def x_for(target_value)
      result = target_value.abs / options[:max].to_f * options[:width] + options[:padding]

      case mode
      when :positive
        result
      when :negative
        full_width - result
      when :dual
        target_value / options[:max].to_f * half_width + half_width + options[:padding]
      end
    end
  end
end
