
require 'aws-sdk'


class AwsCredentials

	def initialize()
		print "\n[available usernames]\n"
		print "chilyard\n"
		print "adm_chilyard\n"
		print "enter username: "
		$stdout.flush
		username = gets.chomp!
    		if username
				$credentials = Aws::SharedCredentials.new(profile_name: username)

				else
				abort("\nno username entered") 
		end

		print "\n[available regions]\n"
		print "us-east-1, us-west-2, us-west-1, eu-west-1, \n"
		print "eu-central-1, ap-southeast-1, ap-southeast-2, \n"
		print "ap-northeast-1, sa-east-1\n"
		print "enter region: "
		$stdout.flush
		region = gets.chomp!
			if region 
				ENV['AWS_REGION'] = region

				else
				abort("\nno region entered")
			end
	end
end



