# PasswordCrack

crack password by dicts
all the dicts has created .This program will auto download the password dict which you specified.

example dict_name:week_password_sample
You could see all the dicts on: https://github.com/luaxlou/week_password/tree/master/dicts

## features
- single thread  md5 crack   
- check password is week

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


```ruby
 
      password = '12345679'
      cracker = PasswordCrack::Cracker.new 
      
      expect('week_password_sample').to eq(cracker.check_is_week(password))

      password = '1234569' 
      
      expect(nil).to eq(cracker.check_is_week(password))
      
      password1 = '20140501'
    
      expect('birthday').to eq(cracker.check_is_week(password1))

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

```bash
$ password_is_week
check passwrod is week

Usage:
    password_is_week <password>
Example:
    password_is_week 12345679
  -h, --help    Show this message

$ password_is_week 12345679
"passowrd(12345679) is week,found in dict <week_password_sample>"
$ password_is_week 1234569
"passowrd(1234569) is strong now,just now."
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luaxlou/password_crack.  


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

