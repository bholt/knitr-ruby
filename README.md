knitr-ruby
==========

Ruby wrapper for the knitr R library for elegant, flexible and fast dynamic report generation with R. See [knitr](http://yihui.name/knitr/) homepage for more info.

## Installation

Install [R](http://www.r-project.org/).

Run `bundle install` after adding the gem to your `Gemfile`:

    gem "knitr-ruby", "~> 0.0.3"

If you are not using Bundler, install as gem:

    [sudo] gem install knitr-ruby

## Use

```ruby
require 'knitr-ruby'

options = { "fig.show" => "hold",
            "fig.path" => "figures/",
            "fig.width" => 10,
            "fig.height" => 7,
            "dev" => "svg" }

knitr = KnitrRuby::Knitr.new(chunk_options: options)
content = knitr.knit(content)
```

See the [knitr options page](http://yihui.name/knitr/options) for available knitr options.

## License
[MIT License](LICENSE).