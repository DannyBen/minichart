module Minichart
  class AreaChart < Chart
    def build
      element :polyline, fill: options[:color],
        stroke: options[:color],
        stroke_width: options[:stroke],
        stroke_linejoin: :round,
        points: points
    end

  protected

    def points
      result = ["0,#{options[:height]}"]

      inverted_points.each do |point|
        x = options[:width] *point[0]
        y = options[:height] * point[1]
        result << "#{x},#{y}"
      end

      result << "#{options[:width]},#{options[:height]}"

      result
    end
  end
end
