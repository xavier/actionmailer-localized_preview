# ActionMailer::LocalizedPreview

This gem extends [ActionMailer::Preview](http://api.rubyonrails.org/classes/ActionMailer/Preview.html) to allow previews of emails in all available locales.

## Usage

Simply include `ActionMailer::LocalizedPreview` in your preview class

```ruby
require 'action_mailer/localized_preview'

class NotifierPreview < ActionMailer::Preview
  include ActionMailer::LocalizedPreview

  def account_confirmation
    account = Account.new(name: "Cosmo Kramer")
    Notifier.account_confirmation(account)
  end

end

```

Assuming that `I18n.available_locales` is set to `[:en, :fr, :nl]`, it will make the following preview methods available:

  * `account_confirmation_en`
  * `account_confirmation_fr`
  * `account_confirmation_nl`

If you want direct access to the current locale in your mailer preview method, you may add a parameter to your method signature and the locale will be passed on:

```ruby
require 'action_mailer/localized_preview'

class NotifierPreview < ActionMailer::Preview
  include ActionMailer::LocalizedPreview

  def account_confirmation(locale)
    account = Account.new(name: "Cosmo Kramer", prefered_language: locale)
    Notifier.account_confirmation(account)
  end

end

```

### Caveats

* This was built for **Rails 4.1 onwards** and **wont work** with the [mail_view](https://github.com/basecamp/mail_view) gem which is the ancestor of the mailer preview feature but sports a different API
* It hasn't been tested with locales containing a regional setting (e.g. `en-US`, `en-GB`, ...) and these are most probably not supported at this point.

## Installation

Add this line to your application's Gemfile:

    gem 'actionmailer-localized_preview'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install actionmailer-localized_preview

## Contributing

1. Fork it ( https://github.com/[my-github-username]/actionmailer-localized_preview/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
