require 'spec_helper'

describe PasswordCrack do
  it 'has a version number' do

    expect(PasswordCrack::VERSION).not_to be nil
  end

  it 'create password dict' do

  	dict = PasswordCrack::Dict.new 'week_password_sample.txt'
  	# dict.clean

    expect(true).to eq(File.exists?(dict.create))
  end


  it 'create an md5 password' do

  		md5Password = 'e10adc3949ba59abbe56e057f20f883e'

  		cracker = PasswordCrack::Md5Cracker.new 

  		result = cracker.crack md5Password,'week_password_sample.txt.md5'

  		expect(result).to eq('123456')

       md516Password = '49ba59abbe56e057'

       result = cracker.crack md516Password,'week_password_sample.txt.md5'
       expect(result).to eq('123456')

  end 

end
