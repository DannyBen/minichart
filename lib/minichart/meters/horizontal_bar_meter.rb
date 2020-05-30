module Minichart
  class HorizontalBarMeter < Meter
    def build
      draw_bar
      draw_notches if notches
      draw_clipping_indicator if clipping_indicator and clipping?
    end

  protected

    def draw_bar
      x1 = x_for 0
      x2 = x_for clamped_value
      x = [x1, x2].min

      element :rect, x: x, y: 0, height: height, width: bar_width, style: style
    end

    def draw_notches
      notches.each do |notch|
        draw_notch notch
        draw_notch -notch if mode == :dual and notch != 0
      end
    end

    def draw_notch(notch)
      draw_vertical_line notch, stroke: notch_thickness, color: notch_color
    end

    def draw_clipping_indicator
      draw_vertical_line clamped_value,
        stroke: clipping_indicator_thickness,
        color: clipping_indicator_color
    end

    def draw_vertical_line(target_value, color:, stroke:)
      x = x_for target_value

      element :line, x1: x, x2: x, y1: 0, y2: height,
        stroke: color, stroke_width: stroke
    end

    def width_factor
      width / max.to_f
    end

    def half_width
      width * 0.5
    end

    def bar_width
      if mode == :dual
        clamped_value.abs * width_factor * 0.5
      else
        clamped_value.abs * width_factor
      end
    end

    def x_for(target_value)
      result = target_value.abs / max.to_f * width

      case mode
      when :positive
        result
      when :negative
        width - result
      when :dual
        target_value / max.to_f * half_width + half_width
      end
    end
  end
end
