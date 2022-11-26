module Minichart
  class AreaChart < Chart
    def build
      element :polyline, fill: options[:color],
        stroke: options[:color],
        stroke_width: options[:stroke],
        stroke_linejoin: :round,
        stroke_linecap: :round,
        points: points
    end

  protected

    def points
      first_point = "#{options[:padding]},#{options[:height] + options[:padding]}"
      result = [first_point]

      inverted_points.each do |point|
        x = (options[:width] * point[0]) + options[:padding]
        y = (options[:height] * point[1]) + options[:padding]
        result << "#{x},#{y}"
      end

      result << "#{options[:width] + options[:padding]},#{options[:height] + options[:padding]}"
      result << first_point

      result
    end
  end
end
