module Minichart
  class HorizontalBarMeter < Meter
    def build
      draw_bar
      draw_zero_line if zero_line
      draw_clipping_indicator if clipping_indicator and clipping?
    end

  protected

    def draw_bar
      x = if mode == :negative
        width - bar_width
      elsif mode == :dual
        middle = width * 0.5
        value >= 0 ? middle : middle - bar_width
      else
        0
      end

      element :rect, x: x, y: 0, height: height, width: bar_width, style: style
    end

    def draw_clipping_indicator
      x = if mode == :positive or (mode == :dual and value > 0)
        width - clipping_indicator_size
      else
        0
      end

      element :rect, x: x, y: 0,
        height: height, width: clipping_indicator_size,
        fill: clipping_indicator_color, stroke_width: 0

    end

    def draw_zero_line
      x = if mode == :negative
        width - zero_line_size
      elsif mode == :dual
        width / 2 - zero_line_size / 2
      else
        0
      end

      element :rect, x: x, y: 0,
        height: height, width: zero_line_size,
        fill: zero_line_color, stroke_width: 0

    end

    def width_factor
      width / max.to_f
    end

    def bar_width
      if mode == :dual
        clamped_value.abs * width_factor * 0.5
      else
        clamped_value.abs * width_factor
      end
    end
  end
end
