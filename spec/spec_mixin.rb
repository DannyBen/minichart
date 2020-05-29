module SpecMixin
  def spec_from_yaml(set)
    examples = YAML.load_file("spec/minichart/examples.yml")['examples'][set]
    
    examples.each do |name, config|
      approval_file = "#{set}/#{name}.svg"
      data = config['data']
      options = config['options'].transform_keys(&:to_sym)
      p options
      subject = described_class.new data, options

      IDGenerator.reset

      describe name do
        it "works" do
          expect(subject.render).to match_approval approval_file
        end
      end
    end
  end
end