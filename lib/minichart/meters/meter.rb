module Minichart
  # Base class for charts with a single value
  class Meter < Base
    def value
      data
    end
  end
end
