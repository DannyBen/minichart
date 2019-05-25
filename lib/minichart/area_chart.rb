module Minichart
  class AreaChart < Chart
    def build
      svg.polyline fill: color,
        stroke: color,
        stroke_width: stroke,
        stroke_linejoin: :round,
        points: points
    end

  protected

    def points
      result = ["0,#{height}"]

      inverted_points.each do |point|
        x = width*point[0]
        y = height*point[1]
        result << "#{x},#{y}"
      end

      result << "#{width},#{height}"

      result
    end
  end
end
