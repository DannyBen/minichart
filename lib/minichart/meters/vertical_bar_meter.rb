module Minichart
  class VerticalBarMeter < Meter
    def build
      draw_bar
      draw_notches if notches
      draw_clipping_indicator if clipping_indicator and clipping?
    end

  protected

    def width
      opts[:width] ||= 100
    end

    def height
      opts[:height] ||= (aspect_ratio * width).round
    end

    def draw_bar
      y1 = y_for 0
      y2 = y_for clamped_value
      y = [y1, y2].min

      element :rect, x: 0, y: y, height: bar_height, width: width, style: style
    end

    def draw_notches
      notches.each do |notch|
        draw_notch notch
        draw_notch -notch if mode == :dual and notch != 0
      end
    end

    def draw_notch(notch)
      draw_horizontal_line notch, stroke: notch_thickness, color: notch_color
    end

    def draw_clipping_indicator
      draw_horizontal_line clamped_value,
        stroke: clipping_indicator_thickness,
        color: clipping_indicator_color
    end

    def draw_horizontal_line(target_value, color:, stroke:)
      y = y_for target_value

      element :line, x1: 0, x2: width, y1: y, y2: y,
        stroke: color, stroke_width: stroke
    end

    def y_for(target_value)
      result = target_value.abs / max.to_f * height

      case mode
      when :positive
        height - result
      when :negative
        result
      when :dual
        height - (target_value / max.to_f * half_height + half_height)
      end
    end

    def height_factor
      height / max.to_f
    end

    def half_height
      height * 0.5
    end

    def bar_height
      if mode == :dual
        clamped_value.abs * height_factor * 0.5
      else
        clamped_value.abs * height_factor
      end
    end
  end
end
