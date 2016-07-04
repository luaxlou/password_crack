require 'spec_helper'

describe PasswordCrack do
  it 'has a version number' do

    expect(PasswordCrack::VERSION).not_to be nil
  end

  it 'create password dict' do

  	dict = PasswordCrack::Dict.new 'week_password_sample','md5'
  	# dict.clean

    expect(true).to eq(File.exists?(dict.create))
  end


  it 'create an md5 password' do

  		md5Password = 'e10adc3949ba59abbe56e057f20f883e'
  		cracker = PasswordCrack::Md5Cracker.new 
      dict_name = 'week_password_sample' #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
  		result = cracker.crack md5Password,dict_name
  		expect(result).to eq('123456')

      md516Password = '49ba59abbe56e057'
      result = cracker.crack md516Password,dict_name
      expect(result).to eq('123456')

  end 


 it 'check password is week' do

      password = '12345679'
      cracker = PasswordCrack::Cracker.new 
      
      expect('week_password_sample').to eq(cracker.check_is_week(password))

      password = '1234569' 
      
      expect(nil).to eq(cracker.check_is_week(password))
      
      password1 = '20140501'
    
      expect('birthday').to eq(cracker.check_is_week(password1))

  end 
end
