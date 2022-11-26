module SpecMixin
  def load_yaml(path)
    YAML.load_file path, aliases: true
  rescue ArgumentError
    # :nocov:
    YAML.load_file path
    # :nocov:
  end

  def spec_from_yaml(set)
    examples = load_yaml('spec/minichart/examples.yml')['examples'][set]

    examples.each do |name, config|
      approval_file = "#{set}/#{name}.svg"
      data = config['data']
      options = config['options'].transform_keys(&:to_sym)
      subject = described_class.new data, options

      IDGenerator.reset

      describe name do
        it 'generates the expected SVG' do
          expect(subject.render).to match_approval approval_file
        end
      end
    end
  end
end
