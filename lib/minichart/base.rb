module Minichart
  # Base class for all Minichart classes
  class Base < Victor::SVGBase
    attr_reader :aspect_ratio, :background, :color, :data,
      :height, :stroke, :style, :width, :opts

    def initialize(data, opts = {})
      @data, @opts = data, opts
      
      # super height: height, width: width, style: style, viewBox: viewbox
      super viewBox: viewbox, style: style
      element :rect, x: 0, y: 0, width: width, height: height,
        fill: background, stroke_width: 0

      clip_path_id = IDGenerator.next
      setup_clip_path clip_path_id

      element :g, clip_path: "url(##{clip_path_id})" do
        build
      end      
    end

    def setup_clip_path(id)
      element :defs do
        element :clipPath, id: id do
          element :rect, width: width, height: height
        end
      end
    end

    def background
      opts[:background] ||= 'white'
    end

    def aspect_ratio
      opts[:aspect_ratio] ||= 3
    end

    def height
      opts[:height] ||= 100
    end

    def width
      opts[:width] ||= (aspect_ratio * height).round
    end

    def stroke
      opts[:stroke] ||= 2
    end

    def style
      opts[:style] ||= {}
    end

    def color
      opts[:color] ||= '#333'
    end

    def viewbox
      "0 0 #{width} #{height}"
    end

    def build
      raise NotImplementedError, "#build is not implemented"
    end
  end
end
