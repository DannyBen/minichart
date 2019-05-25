module Minichart
  class LineChart < Chart
    def build
      svg.polyline fill: :none,
        stroke: color,
        stroke_width: stroke,
        stroke_linejoin: :round,
        points: points
    end

  private

    def points
      result = []
      inverted_points.each do |point|
        x = width*point[0]
        y = height*point[1]
        result << "#{x},#{y}"
      end
      result
    end
  end
end
