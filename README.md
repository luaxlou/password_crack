# PasswordCrack

crack password by dicts,
suppert  single thread  md5 crack now 

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'password_crack'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install password_crack

## Usage
 

```ruby
require 'password_crack'
md5Password = 'e10adc3949ba59abbe56e057f20f883e'
cracker = PasswordCrack::Md5Cracker.new 
dict_name = 'week_password_sample' #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
result = cracker.crack md5Password,dict_name
p result
 
md516Password = '49ba59abbe56e057'
result = cracker.crack md516Password,dict_name
p result
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luaxlou/password_crack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

