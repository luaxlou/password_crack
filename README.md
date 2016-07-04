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
    md5Password = 'e10adc3949ba59abbe56e057f20f883e'
    cracker = PasswordCrack::Md5Cracker.new 
    dict_name = 'week_password_sample' #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
    result = cracker.crack md5Password,dict_name
    expect(result).to eq('123456')
      
    md516Password = '49ba59abbe56e057'
    result = cracker.crack md516Password,dict_name
    expect(result).to eq('123456')

```

## Command Line Usage

```bash
$ password_crack
creack passwrod by dicts

Usage:
    password_crack <crypted_password> [options]
Example:
    password_crack e10adc3949ba59abbe56e057f20f883e
where [options] are:
  -d, --dict=<s>     dict name (default: week_password_sample)
  -c, --crypt=<s>    crypt type  (default: md5)
  -h, --help         Show this message


```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luaxlou/password_crack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

