module Minichart
  class VerticalBarMeter < Meter
    def build
      draw_bar
      draw_zero_line if zero_line
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
      y = if mode == :positive
        height - bar_height
      elsif mode == :dual
        middle = height * 0.5
        value >= 0 ? middle - bar_height : middle
      else
        0
      end

      element :rect, x: 0, y: y, height: bar_height, width: width, style: style
    end

    def draw_clipping_indicator
      y = if mode == :negative or (mode == :dual and value < 0)
        height - clipping_indicator_size
      else
        0
      end

      element :rect, x: 0, y: y,
        height: clipping_indicator_size, width: width,
        fill: clipping_indicator_color, stroke_width: 0

    end

    def draw_zero_line
      y = if mode == :positive
        height - zero_line_size
      elsif mode == :dual
        height / 2 - zero_line_size / 2
      else
        0
      end

      element :rect, x: 0, y: y,
        height: zero_line_size, width: width,
        fill: zero_line_color, stroke_width: 0

    end

    def height_factor
      height / max.to_f
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
