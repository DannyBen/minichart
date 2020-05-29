module SpecMixin
  def default_options
    {
      background: '#ddd',
      aspect_ratio: 4,
      height: 25,
      # width: 300 # aspect_ratio supercedes
      stroke: 3,
      style: { additional: 'styling' },
      color: 'purple'
    }
  end
end