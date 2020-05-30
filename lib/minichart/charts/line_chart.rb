module Minichart
  class LineChart < Chart
    def build
      element :polyline, fill: :none,
        stroke: options[:color],
        stroke_width: options[:stroke],
        stroke_linejoin: :round,
        points: points
    end

  protected

    def points
      result = []
      inverted_points.each do |point|
        x = options[:width] * point[0]
        y = options[:height] * point[1]
        result << "#{x},#{y}"
      end
      result
    end
  end
end
