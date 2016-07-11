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

   		cracker = PasswordCrack::Md5Cracker.new 
      dict_name =  #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
  		result = cracker.crack 'e10adc3949ba59abbe56e057f20f883e',dict_name
  		expect(result).to eq('123456')

       result = cracker.crack '49ba59abbe56e057',dict_name
      expect(result).to eq('123456')


       result = cracker.crack '49ba59abbe56e057','number_1_to_6'
      expect(result).to eq('123456')



      md5Password = 'd41d8cd98f00b204e9800998ecf8427e'
      result = cracker.crack md5Password,dict_name
      expect(result).to eq('')

  end 


 it 'check password is week' do

      cracker = PasswordCrack::Cracker.new 
      
      expect('week_password_sample').to eq(cracker.check_is_week('12345679'))
       
      expect(nil).to eq(cracker.check_is_week('1234569' ))   
     
      expect('birthday').to eq(cracker.check_is_week('20140501'))
    
      expect('words').to eq(cracker.check_is_week('lana'))

  end 
end
