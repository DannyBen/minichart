module Minichart
  # Base class for all Minichart classes
  class Base < Victor::SVGBase
    attr_reader :data, :options

    class << self
      def master_defaults
        {
          background: 'white',
          height: 100,
          width: 300,
          stroke: 2,
          style: {},
          color: '#66f',
          padding: 10,
        }
      end

      # For subclasses to define
      def defaults
        {}
      end

      def options(update_hash = nil)
        @options ||= master_defaults.merge defaults
        @options.merge! update_hash if update_hash
        @options
      end
    end

    def initialize(data, user_options = {})
      @data = data
      @options = self.class.options.merge user_options

      super viewBox: viewbox, style: options[:style]
      element :rect, x: 0, y: 0,
        width: full_width, height: full_height,
        fill: options[:background], stroke_width: 0

      clip_path_id = IDGenerator.next
      setup_clip_path clip_path_id

      element :g, clip_path: "url(##{clip_path_id})" do
        build
      end      
    end

    def setup_clip_path(id)
      element :defs do
        element :clipPath, id: id do
          element :rect, width: full_width, height: full_height
        end
      end
    end

    def viewbox
      "0 0 #{full_width} #{full_height}"
    end

    def full_height
      options[:height] + options[:padding] * 2
    end

    def full_width
      options[:width] + options[:padding] * 2
    end

    def build
      raise NotImplementedError, "#build is not implemented"
    end
  end
end
