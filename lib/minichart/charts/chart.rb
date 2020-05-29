module Minichart
  # Base class for charts with data series
  class Chart < Base
  
  protected

    def inverted_points(opts={})
      normalized_points(opts).map { |point| [point[0], 1-point[1]] }
    end

    def normalized_points(opts={})
      x_point_count = opts[:x_point_count] || data.count-1

      range   = (data.max - data.min).to_f
      x_width = 1 / (x_point_count).to_f
      result  = []

      data.each_with_index do |y, index|
        x = index*x_width
        y = (y - data.min) / range
        result << [x,y]
      end

      result
    end

  end
end
