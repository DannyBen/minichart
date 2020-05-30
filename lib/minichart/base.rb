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
          color: '#66f'
        }
      end

      # For subclasses to define
      def defaults
        {}
      end

      def options
        @options ||= master_defaults.merge defaults
      end
    end

    def initialize(data, user_options = {})
      @data = data
      @options = self.class.options.merge user_options

      super viewBox: viewbox, style: options[:style]
      element :rect, x: 0, y: 0,
        width: options[:width], height: options[:height],
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
          element :rect, width: options[:width], height: options[:height]
        end
      end
    end

    def viewbox
      "0 0 #{options[:width]} #{options[:height]}"
    end

    def build
      raise NotImplementedError, "#build is not implemented"
    end
  end
end
