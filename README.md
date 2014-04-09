knitr-ruby
==========

Ruby wrapper for the knitr R library.

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

## License
MIT License, see [LICENSE] for more information.