module Minichart
  module Randomization
    def random_id(prefix: 'minichart')
      "#{prefix}-#{myrand.rand 9999999}"
    end

    def myrand
      @myrand ||= Random.new(1337)  # persistent seed
    end

  end
end