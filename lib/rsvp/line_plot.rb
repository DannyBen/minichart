module RSVP
  class LinePlot < Plot
    def build
      svg.polyline fill: :none, stroke: :black, stroke_width: 2, points: points
    end

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
