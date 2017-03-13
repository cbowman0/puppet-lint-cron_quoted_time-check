puppet-lint-cron_quoted_time-check
===============================

A puppet-lint plugin to check for unquoted numbers in the time parameters of cron resources

## Installing

### From the command line

```shell
$ gem install puppet-lint-cron_quoted_time-check
```

### In a Gemfile

```ruby
gem 'puppet-lint-cron_quoted_time-check', :require => false
```

## Checks

### Unquoted numbers in time parameters of cron resources

The time parameters (hour, minute, month, monthday, weekday) of cron resources should always be quoted if they are numbers

#### What you have done

```puppet
cron { 'foo': hour => 05 }
```

#### What you should have done

```puppet
cron { 'foo': hour => '05' }
```

#### Disabling the check

To disable this check, you can add `--no-cron_quoted_time-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-cron_quoted_time-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_cron_quoted_time')
```

