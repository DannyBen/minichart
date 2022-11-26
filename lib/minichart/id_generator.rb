module Minichart
  module IDGenerator
    class << self
      def next
        @id ||= 0
        "minichart-#{@id += 1}"
      end

      def reset
        @id = 0
      end
    end
  end
end
