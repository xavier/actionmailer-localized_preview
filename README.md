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


### Caveat

It hasn't been tested (and probably does not support) *yet* locales in with a regional setting (e.g. "en-US", "en-GB", ...)

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
