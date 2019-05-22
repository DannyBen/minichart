Minichart - SVG Chart Generator
==================================================

---

Create SVG mini charts with Ruby

---

Install
--------------------------------------------------

```
$ gem install minichart
```

Or with bundler:

```ruby
gem 'minichart'
```

Example
--------------------------------------------------

```ruby
require 'minichart'
include Minichart

plot = LineChart.new
plot.aspect_ratio = 2
plot.data = [10, 30, 20, 40, 30]
plot.save 'line'
```

See more examples (code and SVG output) in the [examples folder][1].


[1]: https://github.com/DannyBen/minichart/tree/master/examples#examples
