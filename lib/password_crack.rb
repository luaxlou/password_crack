require "password_crack/version"
require 'tmpdir'
require 'mechanize'
require 'seven_zip_ruby'

module PasswordCrack

	DICT_DOWNLOAD_FOLDER = 'https://github.com/luaxlou/week_password/raw/master/dicts/'
 


  class Md5Cracker


      #all dict names:see https://github.com/luaxlou/week_password/tree/master/dicts
      def crack md5Password,dict_name='week_password_sample'

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
  		if local_timestamp < server_timestamp

  				download_and_unpack

 			end	 


 		end 

    def create

      pathname = dict_pathname

      load if !File.exists? pathname

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
 			t = read dict_timestamp_pathname

 			return 0 if ( !t)
 				
 			t.to_i

 		end 

 		def server_timestamp
 			t =download dict_timestamp_download_url
      t.to_i
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
         	File.write pathname,content
        	p 'create new file: '+pathname

        end	
 


 	end

end
