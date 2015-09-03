# Mojura::Mailchimp

This MailChimp gem is a module for Mojura, a Content Management System.

The module can be used by editing a pageview and select 'MailChimp subscription' as web module. The maintainer can select a MailChimp list.
After saving, the user will see a small form, with which he or she can subscribe. Currently the users are added as pending users, meaning they
will receive an email to confirm their subscription.

## Installation

Add this line to your application's Gemfile:

    gem 'mojura-mailchimp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mojura-mailchimp

## Usage

Add to following line of code in the config.ru of your Mojura project, after the line ```require 'mojura'```, and use the module in the website.

    require 'mojura-mailchimp'

## Contributing

1. Fork it ( https://github.com/tjosinga/mojura-mailchimp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
