# Fluent::Plugin::Yo

A fluentd plugin to send Yo

## Component

### YoOutput

[Yo!](http://www.justyo.co/)

## Configuration

* Registrer Yo API via http://yoapi.justyo.co/
* Register your account to API account in Yo app
* Configure as below:

```xml
<match yo.**>
  type yo
  api_key foobarbuz
</match>
```

* And then, it is useful to use [fluent-plugin-notifier](https://github.com/tagomoris/fluent-plugin-notifier) to emit yo tag.

## See Also

- https://github.com/tagomoris/fluent-plugin-ikachan

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
