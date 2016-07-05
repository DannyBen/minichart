module RSVP
  class Plot
    attr_accessor :data, :aspect_ratio

    def save(name)
      svg.rect x: 0, y: 0, width: width, height: height, fill: '#ccc'
      build # should be implemented by subclass
      svg.save name
    end

    def inverted_points
      normalized_points.map { |point| [point[0], 1-point[1]] }
    end

    def normalized_points
      range   = (data.max - data.min).to_f
      x_width = 1/(data.count-1).to_f
      result  = []

      data.each_with_index do |y, index|
        x = index*x_width
        y = (y-data.min)/range
        result << [x,y]
      end

      result
    end

    def width
      @width ||= (aspect_ratio * height).round
    end

    def height
      100
    end

    def svg
      @svg ||= SVG.new viewBox: "0 0 #{width} #{height}", style: { background: '#ddd' }
    end
  end
end
