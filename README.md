# Minichart - SVG Chart Generator

---

Create SVG mini charts with Ruby

![demo](examples/multiple.svg)

---

## Install

```shell
$ gem install minichart
```

Or with bundler:

```ruby
gem 'minichart'
```

## Usage

Require and optionally include the library:

```ruby
require 'minichart'
include Minichart
```

Initialize a chart with data, and optional options:

```ruby
data = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 9]
line = LineChart.new data, color: 'blue'
bars = BarChart.new data, color: 'blue'
area = AreaChart.new data, color: 'blue'
```

Get the full SVG output by calling `#render`:

```ruby
puts area.render
#=> <?xml version="1.0" standalone="no"?>
#   <svg> ... </svg>
```

Save it to file, by calling `#save`:

```ruby
area.save "my-chart.svg"
```

Get its inner SVG string by calling `#to_s`:

```ruby
puts area.to_s
#=> <polyline fill="blue" stroke="blue" stroke-width="2" points="..."/>
```


The objects returned from all the mini chart classes are [Victor::SVG][2] objects, so they support all methods supported by it as well.

## Options

All minichart classes support a second hash argument for options

```ruby
chart = LineChart.new data, options
```

| Option         | Default                      | Description             |
| -------------- | ---------------------------- | ----------------------- |
| `background`   | *None*                       | Chart background color  |
| `color`        | #333                         | Chart color             |
| `aspect_ratio` | 3                            | Set automatic width     |
| `height`       | 100                          | Chart height in pixels  |
| `width`        | Calculated by `aspect_ratio` | Chart width in pixels   |
| `stroke`       | 2                            | Line stroke width       |
| `style`        | *None*                       | Style hash for the SVG  |


## Examples

See more examples (code and SVG output) in the [examples folder][1].


[1]: https://github.com/DannyBen/minichart/tree/master/examples#examples
[2]: https://github.com/DannyBen/victor