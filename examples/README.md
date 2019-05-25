# Examples

## area

```ruby
require 'minichart'
include Minichart

plot = AreaChart.new
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'area'
```

[![area](https://cdn.rawgit.com/DannyBen/minichart/master/examples/area.svg)](https://github.com/DannyBen/minichart/blob/master/examples/area.rb)


## area color

```ruby
require 'minichart'
include Minichart

plot = AreaChart.new background: '#fda', color: 'blue'
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'area_color'
```

[![area_color](https://cdn.rawgit.com/DannyBen/minichart/master/examples/area_color.svg)](https://github.com/DannyBen/minichart/blob/master/examples/area_color.rb)


## bar

```ruby
require 'minichart'
include Minichart

plot = BarChart.new
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'bar'
```

[![bar](https://cdn.rawgit.com/DannyBen/minichart/master/examples/bar.svg)](https://github.com/DannyBen/minichart/blob/master/examples/bar.rb)


## bar color

```ruby
require 'minichart'
include Minichart

plot = BarChart.new background: '#fda', color: 'blue'
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'bar_color'
```

[![bar_color](https://cdn.rawgit.com/DannyBen/minichart/master/examples/bar_color.svg)](https://github.com/DannyBen/minichart/blob/master/examples/bar_color.rb)


## larger data

```ruby
require 'minichart'
include Minichart

plot = BarChart.new
plot.aspect_ratio = 10
plot.data = [739.31, 739.39, 729.61, 725.16, 734.15, 735.81, 731.97, 737.82, 724.81, 721.58, 734.16, 738.59, 746.92, 759.42, 756.85, 761.37, 748.96, 752.24, 750.82, 746.3, 743.38, 751.71, 754.81, 750.38, 730.17, 732.83, 745.86, 737.18, 741.87, 749.23, 751.8, 754.46, 754.72, 760.66, 758.44, 751, 752.24, 748.34, 748.7, 741.69, 745.95, 748.16, 752.42, 751.97, 753.39, 751.53, 743.56, 748.78, 752.68, 755.25, 750.29, 753.3, 756.05, 757.11, 757.38, 758.09, 759.95, 759.24, 757.11, 759.15, 758.71, 756.76, 760.92, 766.51, 766.86, 765.62, 761.99, 766.59, 779.8, 777.23, 776.87, 783.34, 776.17, 775.01, 779.62, 778.91, 781.3, 786.89, 787.68, 798.41, 802.66, 807.71, 805.23, 806.29, 770.94, 773.6, 783.96, 783.34, 784.67, 783.34, 782.9, 789.1, 796.46, 786.89, 803.28, 814.87, 817.2, 821.69, 824.2, 821.6, 818.73, 821.6, 814.78]
plot.save 'larger_data'
```

[![larger_data](https://cdn.rawgit.com/DannyBen/minichart/master/examples/larger_data.svg)](https://github.com/DannyBen/minichart/blob/master/examples/larger_data.rb)


## line

```ruby
require 'minichart'
include Minichart

plot = LineChart.new
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'line'
```

[![line](https://cdn.rawgit.com/DannyBen/minichart/master/examples/line.svg)](https://github.com/DannyBen/minichart/blob/master/examples/line.rb)


## line color

```ruby
require 'minichart'
include Minichart

plot = LineChart.new background: '#fda', color: 'blue'
plot.aspect_ratio = 3
plot.data = [10, 30, 20, 40, 30]
plot.save 'line_color'
```

[![line_color](https://cdn.rawgit.com/DannyBen/minichart/master/examples/line_color.svg)](https://github.com/DannyBen/minichart/blob/master/examples/line_color.rb)



---

This file was generated automatically with `run examples readme`.