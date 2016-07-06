require "password_crack/version"
require 'tmpdir'
require 'mechanize'
require 'seven_zip_ruby'

module PasswordCrack

	DICT_DOWNLOAD_FOLDER = 'https://github.com/luaxlou/week_password/raw/master/dicts/'
 

 class Cracker

   def crack crypted_password,dict_name='week_password_sample',crypt_type='md5'

      case crypt_type

      when 'md5'
        c = Md5Cracker.new 

        return c.crack crypted_password,dict_name

      end
        

   end


   def check_is_week password


      p = PasswordChecker.new

      return p.check password

   end



 end


 class PasswordChecker

    def check password

      return 'number_1_to_6' if password.scan(/^\d{1,6}$/).length >0

      result =  check_by_dict password,'week_password_sample'

      return result if result

      result =  check_by_dict password,'birthday'


      return result if result

      return  check_by_dict password,'words'

    end


    def check_by_dict password,dict_name
          d =   Dict.new dict_name
          File.open(d.create).each_line() do |pass|
 
              pass.chomp!

               return dict_name if pass == password 

          end

          return nil
    end


 end 


  class Md5Cracker



      #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
      def crack md5Password,dict_name='week_password_sample'

          return '' if(md5Password == 'd41d8cd98f00b204e9800998ecf8427e')

          iMd516 = (md5Password.length==16)

          d = Dict.new dict_name,'md5'



           File.open(d.create).each_line() do |l|

              (md5,pass) = l.split "\t"

                pass.chomp! 

                md5 =md5[8..23] if iMd516 

               return pass if md5 == md5Password 

          end

          return nil

      end



  end 


 	class Dict

 		def initialize dict_name,dict_type=nil

      dict_name = dict_name+ '.txt'

      dict_name = dict_name + '.' + dict_type if dict_type

 			@dict_name = dict_name
 			@dict_path= Dir.tmpdir
 			@dict_filename = dict_name +'.7z'
 			@dict_filename_timestamp =   @dict_filename +'.timestamp'

      @client = Mechanize.new

 		end

 		public

 		def update

 			load
 		end		

    def clean

       delete dict_7z_pathname
       delete dict_timestamp_pathname
       delete dict_pathname
    end 
 


 		def load
      return  if(Time.now.to_i - local_timestamp < 10 *60)
        

  		if local_timestamp < server_timestamp

  				download_and_unpack

      else

        write dict_timestamp_pathname,Time.now.to_i.to_s if(Time.now.to_i - local_timestamp > 10 *60) 



 			end	 



 		end 

    def create

      pathname = dict_pathname

      load 

      pathname 
    end
    



 		private

    def dict_pathname

         @dict_path+'/'+@dict_filename.gsub(/\.7z/,'')

    end  


    def dict_7z_pathname

      @dict_path+'/'+@dict_filename

    end  


    def dict_timestamp_pathname

      @dict_path+'/'+@dict_filename_timestamp

    end  



    def dict_download_url

      DICT_DOWNLOAD_FOLDER+'/'+@dict_filename

    end  
 
    def dict_timestamp_download_url

      DICT_DOWNLOAD_FOLDER+'/'+@dict_filename_timestamp

    end 

 		def local_timestamp

      return @l_t.to_i if @l_t 
 			@l_t = read dict_timestamp_pathname

 			return 0 if ( !@l_t)
 				
 			@l_t.to_i

 		end 


 		def server_timestamp
      return @t if @t
 			@t =download dict_timestamp_download_url
      @t.to_i
 		end 

 		def download_and_unpack
  			write dict_7z_pathname,download(dict_download_url)
        unpack
  			write dict_timestamp_pathname, server_timestamp

 		end	

 		def download url

 			r = @client.get(url)
    
      r.body
  	end	

 		 def unpack 
        File.open(dict_7z_pathname, "rb") do |file|
            SevenZipRuby::Reader.extract_all(file, @dict_path)
                 delete file.path
                 p 'create new file:' +dict_pathname
         end
      end

        def read pathname
            return nil unless  File.exists? pathname
        	File.read  pathname
        
        end	


        def delete pathname

            if File.exists? pathname

                 File.delete pathname
             p 'delete file:'+pathname
            end
            
        
        end 


        def write pathname,content
                  File.open(pathname, "wb") do |file|

                      file.write content
                  end

         	p 'create new file: '+pathname

        end	
 


 	end

end
