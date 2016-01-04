#
# class to manage users in our build environment 

require 'net/ssh'

class User
    ## constructor
    def initialize()
        print "setting User variables\n"
    	@host = '10.0.2.15'
    	@user = 'chilyard'
    	@pass = '12345678'
    end

    ## add users
    def add()
    
        Net::SSH.start(@host, @user, :password => @pass) do |ssh|
            result = ssh.exec('ls -l') 
            print result, "\n"
        end
    end

    ## delete users
    def delete()
    end
end # end class User
