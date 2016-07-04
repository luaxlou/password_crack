# PasswordCrack

crack password by dicts,
suppert  single thread  md5 crack now  

all the dicts has created .This program will auto download the password dict which you specified.

example dict_name:week_password_sample
You could see all the dicts on: https://github.com/luaxlou/week_password/tree/master/dicts

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
    dict_name = 'week_password_sample' 
    #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
    result = cracker.crack md5Password,dict_name
    expect(result).to eq('123456')
      
    md516Password = '49ba59abbe56e057'
    result = cracker.crack md516Password,dict_name
    expect(result).to eq('123456')

```

## Command Line Usage

```bash
$ password_crack
creack password by dicts

Usage:
    password_crack <crypted_password> [options]
Example:
    password_crack e10adc3949ba59abbe56e057f20f883e
where [options] are:
  -d, --dict=<s>     dict name (default: week_password_sample)
  -c, --crypt=<s>    crypt type  (default: md5)
  -h, --help         Show this message

$ password_crack e10adc3949ba59abbe56e057f20f883e
"crack success! result is:123456"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luaxlou/password_crack.  


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

